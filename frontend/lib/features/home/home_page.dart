import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/fillup.dart';
import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/features/assessments/activity_assessments_page.dart';
import 'package:ai_school/features/assessments/fillup_assessment_page.dart';
import 'package:ai_school/features/classes/providers/classes_provider.dart';
import 'package:ai_school/features/classes/widgets/write_class_dialog.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/custom_grid_view.dart';
import 'package:ai_school/features/schools/providers/school_provider.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:ai_school/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final classIdProvider = StateProvider<String?>((ref) {
  return null;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final school = ref.watch(yourSchoolProvider).asData?.value;

    final classesAsync = ref.watch(classesProvider);

    final classId = ref.watch(classIdProvider);

    return Scaffold(
      backgroundColor: context.scheme.surface,
      appBar: AppBar(
        // backgroundColor: context.scheme.surface,
        centerTitle: true,
        title: Text(Labels.appName),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(bottom: 8),
              child: Center(
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        school?.name ?? '',
                        style: context.style.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (classesAsync.hasValue)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.scheme.outlineVariant,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.only(left: 8, right: 4),
                        child: DropdownButton(
                          value: classId,
                          items:
                              classesAsync.value!
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.label),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (v) {
                            ref.read(classIdProvider.notifier).state = v;
                          },
                          underline: SizedBox.shrink(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: AsyncWidget(
        value: classesAsync,
        data: (classes) {
          return HookBuilder(
            builder: (context) {
              useEffect(() {
                if (classes.isNotEmpty && classId == null) {
                  Future.delayed(Duration.zero, () {
                    ref.read(classIdProvider.notifier).state = classes.first.id;
                  });
                }
              }, [classes.isNotEmpty]);
              return classes.isEmpty
                  ? Center(
                    child: FilledButton.tonalIcon(
                      onPressed: () async {
                        final value = await showDialog(
                          context: context,
                          builder: (context) => WriteClassDialog(),
                        );
                        if (value is Class) {
                          ref.read(classesProvider.notifier).sync(value);
                        }
                      },
                      label: Text('Add Class'),
                      icon: Icon(Icons.add_rounded),
                    ),
                  )
                  : classId != null
                  ? AsyncWidget(
                    value: ref.watch(studentsProvider(classId)),
                    data: (students) {
                      final class$ = classes.firstWhere((e) => e.id == classId);
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: Card(
                                    child: InkWell(
                                      onTap: () {
                                        context.push(
                                          '/students',
                                          extra: class$,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          spacing: 4,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text('Students'),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_right_rounded,
                                                  size: 20,
                                                  color: context.scheme.outline,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${students.length}',
                                              style: context.style.titleLarge
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        spacing: 4,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Domains/Subjects'),
                                          Text(
                                            '${Area.list(class$.grade).length}',
                                            style: context.style.titleLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 8,
                              children:
                                  Area.list(class$.grade)
                                      .map(
                                        (e) => Card(
                                          child: InkWell(
                                            onTap: () {
                                              context.push(
                                                '/activity-assessments',
                                                extra: ActivityAssessmentsPageArgs(
                                                  class$: class$,
                                                  area: e,
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              child: Column(
                                                spacing: 8,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(e.label),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right_rounded,
                                                        size: 20,
                                                        color:
                                                            context
                                                                .scheme
                                                                .outline,
                                                      ),
                                                    ],
                                                  ),
                                                  if (false)
                                                    FillupProgressBar(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                            Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Fillups'),
                                CustomGridView(
                                  spacing: 8,
                                  verticalSpacing: 8,
                                  children:
                                      Fillup.values
                                          .map(
                                            (e) => Card(
                                              child: InkWell(
                                                onTap: () {
                                                  if (e == Fillup.info) {
                                                    context.push(
                                                      '/students-infos',
                                                      extra: class$,
                                                    );
                                                  } else if (e ==
                                                      Fillup.about) {
                                                    context.push(
                                                      '/fillup-assessment',
                                                      extra:
                                                          FillupAssessmentPageArgs(
                                                            type:
                                                                AssessmentType
                                                                    .about,
                                                            class$: class$,
                                                          ),
                                                    );
                                                  } else if (e ==
                                                      Fillup.parent) {
                                                    context.push(
                                                      '/fillup-assessment',
                                                      extra:
                                                          FillupAssessmentPageArgs(
                                                            type:
                                                                AssessmentType
                                                                    .parent,
                                                            class$: class$,
                                                          ),
                                                    );
                                                  } else if (e == Fillup.peer) {
                                                    context.push(
                                                      '/fillup-assessment',
                                                      extra:
                                                          FillupAssessmentPageArgs(
                                                            type:
                                                                AssessmentType
                                                                    .peer,
                                                            class$: class$,
                                                          ),
                                                    );
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Column(
                                                    spacing: 8,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              e.label,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_right_rounded,
                                                            size: 20,
                                                            color:
                                                                context
                                                                    .scheme
                                                                    .outline,
                                                          ),
                                                        ],
                                                      ),
                                                      // FillupProgressBar(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  : SizedBox();
            },
          );
        },
      ),
    );
  }
}

class FillupProgressBar extends StatelessWidget {
  const FillupProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 5,
        child: LayoutBuilder(
          builder: (context, ctx) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: ctx.maxWidth / 3,
                  child: ColoredBox(color: Colors.green.shade200),
                ),
                SizedBox(
                  width: ctx.maxWidth / 3,
                  child: ColoredBox(color: Colors.amber.shade200),
                ),
                SizedBox(
                  width: ctx.maxWidth / 3,
                  child: ColoredBox(color: Colors.grey.shade200),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
