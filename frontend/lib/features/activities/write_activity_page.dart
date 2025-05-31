// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:ai_school/core/data.dart';
import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';
import 'package:ai_school/core/enums/rubric.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/core/repositories/activity_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/components/tag_text.dart';
import 'package:ai_school/features/data/competencies_search_delegate.dart';
import 'package:ai_school/features/data/goals_search_delegate.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteActivityPageArgs {
  final Area area;
  final Grade grade;
  final Activity? initial;
  WriteActivityPageArgs({
    required this.area,
    required this.grade,
    this.initial,
  });
}

class WriteActivityPage extends HookConsumerWidget {
  const WriteActivityPage({super.key, required this.args});

  final WriteActivityPageArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = useState<Activity>(
      args.initial ??
          Activity(
            id: '',
            schoolId: ref.read(sessionProvider)!.schoolId!,
            grade: args.grade,
            area: args.area,
            title: '',
            description: '',
            questions: null,
            goals: [],
            competencies: [],
            rubric: {},
          ),
    );

    final edit = args.initial != null;
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final loading = useState<bool>(false);

    final buildKey = useState(0);

    loading.value = false;

    final repo = ref.read(activityRepositoryProvider);

    Future<void> saveActivity() async {
      if (!formKey.currentState!.validate()) return;
      // loading.value = true;
      try {
        var updated = activity.value;

        if (edit) {
          updated = await repo.updateActivity(updated.id, updated);
        } else {
          updated = await repo.createActivity(updated);
        }
        context.pop(updated);
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('${edit ? 'Edit' : 'Create'} Activity')),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton(
          onPressed: loading.value ? null : saveActivity,
          child: LoadingButtonTextWrapper(
            loading: loading.value,
            child: const Text('Save'),
          ),
        ),
      ),

      body: AbsorbPointer(
        absorbing: loading.value,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 16,
              key: ValueKey('build-${buildKey.value}'),

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DropdownButtonFormField<Grade>(
                //   value: activity.value.grade,
                //   decoration: const InputDecoration(
                //     labelText: 'Grade (Optional)',
                //   ),
                //   items:
                //       Grade.values.map((grade) {
                //         return DropdownMenuItem(
                //           value: grade,
                //           child: Text(grade.label),
                //         );
                //       }).toList(),
                //   onChanged: (Grade? value) {
                //     activity.value = activity.value.copyWith(grade: value);
                //   },
                // ),
                DropdownButtonFormField<Area>(
                  value: activity.value.area,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Domain/Subject*',
                  ),
                  items:
                      Area.list(args.grade).map((area) {
                        return DropdownMenuItem(
                          value: area,
                          child: Text(area.label),
                        );
                      }).toList(),
                  onChanged:
                      (value) =>
                          activity.value = activity.value.copyWith(
                            area: value!,
                          ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    Text('Curricular Goals', style: context.style.titleSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          activity.value.goals
                              .map(
                                (e) => TagText(tag: e, text: Data.getGoal(e)),
                              )
                              .toList(),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        final value = await showSearch(
                          context: context,
                          delegate: GoalsSearchDelegate(
                            area: activity.value.area,
                            selected: activity.value.goals,
                          ),
                        );

                        if (value is List<String>) {
                          activity.value = activity.value.copyWith(
                            goals: value,
                            competencies:
                                activity.value.competencies
                                    .where(
                                      (e) => Data.getCompetencies(
                                        activity.value.area,
                                        goals: value,
                                      ).contains(e),
                                    )
                                    .toList(),
                          );
                        }
                      },
                      label: Text(
                        activity.value.goals.isEmpty
                            ? 'Add Goals'
                            : 'Edit Goals',
                      ),
                      icon: Icon(
                        activity.value.goals.isEmpty
                            ? Icons.add_rounded
                            : Icons.edit_rounded,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    Text('Competencies', style: context.style.titleSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          activity.value.competencies
                              .map(
                                (e) => TagText(
                                  tag: e,
                                  text: Data.getCompetency(e),
                                ),
                              )
                              .toList(),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        final value = await showSearch(
                          context: context,
                          delegate: CompetenciesSearchDelegate(
                            goals: activity.value.goals,
                            area: activity.value.area,
                            selected: activity.value.competencies,
                          ),
                        );

                        if (value is List<String>) {
                          activity.value = activity.value.copyWith(
                            competencies: value,
                          );
                        }
                      },
                      label: Text(
                        '${activity.value.goals.isEmpty ? 'Add' : 'Edit'} Competencies',
                      ),
                      icon: Icon(
                        activity.value.goals.isEmpty
                            ? Icons.add_rounded
                            : Icons.edit_rounded,
                      ),
                    ),
                  ],
                ),

                // Material(
                //   color: context.scheme.tertiaryContainer.withValues(
                //     alpha: 0.5,
                //   ),
                //   borderRadius: BorderRadius.circular(12),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: HookConsumer(
                //       builder: (context, ref, child) {
                //         final state = ref.watch(activityGeneratorProvider);
                //         final notifier = ref.read(
                //           activityGeneratorProvider.notifier,
                //         );
                //         final text = useRef('');
                //         return Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           spacing: 8,
                //           children: [
                //             Text('Generate activity by AI'),
                //             TextFormField(
                //               initialValue: text.value,
                //               enabled: !state.isLoading,
                //               decoration: InputDecoration(
                //                 hintText: 'Enter an idea/topic (optional)',
                //               ),
                //               onChanged: (value) {
                //                 text.value = value.trim();
                //               },
                //             ),
                //             Center(
                //               child: ElevatedButton(
                //                 onPressed:
                //                     state.isLoading
                //                         ? null
                //                         : () async {
                //                           final value = await notifier
                //                               .generateActivity(
                //                                 text:
                //                                     '${text.value.crim ?? 'Generate activity'} for ${args.grade.label} students',
                //                                 learningGoals:
                //                                     activity.value.goals
                //                                         .map(
                //                                           (e) => MapEntry(
                //                                             e,
                //                                             Data.getGoal(e),
                //                                           ),
                //                                         )
                //                                         .toList(),
                //                                 competencies:
                //                                     activity.value.competencies
                //                                         .map(
                //                                           (e) => MapEntry(
                //                                             e,
                //                                             Data.getCompetency(
                //                                               e,
                //                                             ),
                //                                           ),
                //                                         )
                //                                         .toList(),
                //                               );
                //                           if (value != null) {
                //                             activity
                //                                 .value = activity.value.copyWith(
                //                               title: value['title'],
                //                               description: value['description'],
                //                               questions: List<String>.from(
                //                                 value['questions'] ?? [],
                //                               ),
                //                               rubric:
                //                                   (value['rubric']
                //                                           as Map<
                //                                             String,
                //                                             dynamic
                //                                           >?)
                //                                       ?.map(
                //                                         (
                //                                           key,
                //                                           value,
                //                                         ) => MapEntry(
                //                                           RubricAbility.values
                //                                               .firstWhere(
                //                                                 (e) =>
                //                                                     e.name ==
                //                                                     key,
                //                                               ),
                //                                           Map<
                //                                             RubricLevel,
                //                                             String
                //                                           >.from(
                //                                             (value as Map).map(
                //                                               (
                //                                                 key,
                //                                                 value,
                //                                               ) => MapEntry(
                //                                                 RubricLevel
                //                                                     .values
                //                                                     .firstWhere(
                //                                                       (
                //                                                         element,
                //                                                       ) =>
                //                                                           element
                //                                                               .name ==
                //                                                           key,
                //                                                     ),
                //                                                 value,
                //                                               ),
                //                                             ),
                //                                           ),
                //                                         ),
                //                                       ) ??
                //                                   {},
                //                             );
                //                             buildKey.value++;
                //                           }
                //                         },
                //                 child: LoadingButtonTextWrapper(
                //                   loading: state.isLoading,
                //                   child: Text('Generate'),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         );
                //       },
                //     ),
                //   ),
                // ),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: activity.value.title,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Activity Title*',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged:
                      (value) =>
                          activity.value = activity.value.copyWith(
                            title: value.trim(),
                          ),
                  validator:
                      (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                ),

                TextFormField(
                  minLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  maxLines: 8,
                  initialValue: activity.value.description,
                  decoration: const InputDecoration(labelText: 'Description*'),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged:
                      (value) =>
                          activity.value = activity.value.copyWith(
                            description: value.trim(),
                          ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                  maxLength: 500,
                ),
                TextFormField(
                  maxLines: 3,
                  initialValue: activity.value.questions?.join('\n'),
                  decoration: const InputDecoration(
                    labelText: 'Questions (optional)',
                  ),
                  onChanged:
                      (value) =>
                          activity.value = activity.value.copyWith(
                            questions: value.split('\n'),
                          ),
                  maxLength: 500,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Rubric', style: context.style.titleSmall),
                    Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:
                          RubricAbility.values
                              .map(
                                (a) => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  spacing: 8,
                                  children: [
                                    Text(a.name.capLabel),
                                    ...RubricLevel.values.map(
                                      (l) => TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        initialValue:
                                            activity.value.rubric[a]?[l],
                                        minLines: 1,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          labelText: l.name.capLabel,
                                        ),
                                        validator: (value) {
                                          return value?.crim == null
                                              ? 'Required'
                                              : null;
                                        },
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(255),
                                        ],
                                        onChanged: (value) {
                                          activity
                                              .value = activity.value.copyWith(
                                            rubric: {
                                              ...activity.value.rubric,
                                              a: {
                                                ...(activity.value.rubric[a] ??
                                                    {}),
                                                l: value.trim(),
                                              },
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
