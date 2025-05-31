// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/features/activities/activites_search_delegate.dart';
import 'package:ai_school/features/assessments/assessment_page.dart';
import 'package:ai_school/features/assessments/providers/assessments_provider.dart';
import 'package:ai_school/features/assessments/widgets/write_activity_assessment_dialog.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/empty_message_view.dart';
import 'package:ai_school/features/groups/providers/groups_provider.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActivityAssessmentsPageArgs {
  final Class class$;
  final Area area;
  ActivityAssessmentsPageArgs({required this.class$, required this.area});
}

class ActivityAssessmentsPage extends HookConsumerWidget {
  const ActivityAssessmentsPage({super.key, required this.args});

  final ActivityAssessmentsPageArgs args;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final area = useState(args.area);

    final provider = assessmentsProvider(
      classId: args.class$.id,
      type: AssessmentType.activity,
      area: area.value,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${args.class$.label} Activities'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Material(
                color: context.scheme.primaryContainer.withValues(alpha: 0.5),
                shape: StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ).copyWith(left: 12),
                  child: DropdownButton(
                    isExpanded: true,
                    value: area.value,
                    underline: SizedBox.shrink(),
                    items:
                        Area.list(args.class$.grade)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.label),
                              ),
                            )
                            .toList(),
                    onChanged: (v) {
                      area.value = v!;
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton.icon(
          icon: Icon(Icons.add_rounded),
          onPressed: () async {
            final value = await showSearch(
              context: context,
              delegate: ActivitiesSearchDelegate(
                area: area.value,
                grade: args.class$.grade,
              ),
            );
            if (value is Activity) {
            final generated  =await  showDialog(
                // ignore: use_build_context_synchronously
                context: context,
                builder:
                    (context) => WriteActivityAssessmentDialog(
                      class$: args.class$,
                      initial: Assessment(
                        id: '',
                        area: area.value,
                        schoolId: args.class$.schoolId,
                        classId: args.class$.id,
                        type: AssessmentType.activity,
                        name: value.title,
                        medium: 'english',
                        activityId: value.id,
                      ),
                    ),
              );
              if(generated is Assessment){
                ref.read(provider.notifier).sync(generated);
              }
            }
          },
          label: Text('Start new activity'),
        ),
      ),
      body: AsyncWidget(
        value: ref.watch(provider),
        data: (sessions) {
          if (sessions.isEmpty) {
            return EmptyMessageView('No activities found');
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final assessment = sessions[index];

              return ListTile(
                title: Text(assessment.name),
                subtitle:
                    assessment.groupId != null || assessment.studentId != null
                        ? Row(
                          spacing: 12,
                          children: [
                            if (assessment.groupId != null)
                              Consumer(
                                builder: (context, ref, child) {
                                  final group =
                                      ref
                                          .watch(
                                            groupsProvider(assessment.classId),
                                          )
                                          .asData
                                          ?.value
                                          .where((e) => e.id == assessment.groupId)
                                          .firstOrNull;
                                  return Text(
                                    '${group?.name ?? 'Unknown'} Group',
                                  );
                                },
                              ),
                            if (assessment.studentId != null)
                              Consumer(
                                builder: (context, ref, child) {
                                  final student =
                                      ref
                                          .watch(
                                            studentsProvider(assessment.classId),
                                          )
                                          .asData
                                          ?.value
                                          .where(
                                            (e) => e.id == assessment.studentId,
                                          )
                                          .firstOrNull;
                                  return Text(
                                    student != null
                                        ? '${student.rollNo}. ${student.name}'
                                        : 'Unknown Student',
                                  );
                                },
                              ),
                          ],
                        )
                        : null,
                onTap: () {
                  context.push(
                    '/assessment',
                    extra: AssessmentPageArgs(class$: args.class$, assessment: assessment,),
                  );
                },
              );
            },
            itemCount: sessions.length,
          );
        },
      ),
    );
  }
}
