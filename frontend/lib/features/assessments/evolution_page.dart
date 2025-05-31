// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_school/core/enums/likeart_answer.dart';
import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/evolution.dart';
import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/features/assessments/widgets/likeart_answer_selection_view.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/students/widgets/student_header.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EvolutionArgs {
  final Assessment assessment;
  final Student student;
  final Class class$;

  EvolutionArgs({
    required this.assessment,
    required this.student,
    required this.class$,
  });
}

class EvolutionPage extends HookConsumerWidget {
  final EvolutionArgs args;

  const EvolutionPage({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(sessionProvider)!;
    final assessment = args.assessment;

    assessment.sections.sort((a, b) => a.index.compareTo(b.index));

    // final edit = args.initial != null;
    final edit = false;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final loading = useState<bool>(false);

    Future<void> saveEvolution() async {
      if (!formKey.currentState!.validate()) return;
      loading.value = true;
      try {
        context.pop();
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          assessment.type == AssessmentType.activity
              ? '${edit ? 'Edit ' : ''} Evolution'
              : assessment.name,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: Column(
            children: [
              StudentHeader(student: args.student, class$: args.class$),
              //   ActivityHeader(activity: args.activity),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton(
          onPressed: loading.value ? null : saveEvolution,
          child: LoadingButtonTextWrapper(
            loading: loading.value,
            child: const Text('Save'),
          ),
        ),
      ),
      body: HookBuilder(
        builder: (context) {
          final evolution = useState(
            Evolution(
              id: '',
              schoolId: user.schoolId!,
              classId: args.class$.id,
              assessmentId: assessment.id,
              studentId: args.student.id,
            ),
          );

          dynamic getNestedValue(
            String sectionKey, {
            String? typeName,
            String? itemKey,
            String? optionKey,
          }) {
            dynamic current = evolution.value.data[sectionKey];

            if (typeName != null) {
              if (current is Map && current.containsKey(typeName)) {
                current = current[typeName];
              } else {
                return null;
              }
            }

            if (itemKey != null) {
              if (current is Map && current.containsKey(itemKey)) {
                current = current[itemKey];
              } else {
                return null;
              }
            }

            if (optionKey != null) {
              if (current is Map && current.containsKey(optionKey)) {
                current = current[optionKey];
              } else {
                return null;
              }
            }

            return current;
          }

          void updateNestedValue({
            required String sectionKey,
            String? typeName,
            String? itemKey,
            String? optionKey,
            required dynamic newValue,
          }) {
            // Clone root
            final updatedData = Map<String, dynamic>.from(evolution.value.data);

            // Handle 1-level (sectionKey)
            if (typeName == null) {
              if (newValue == null) {
                updatedData.remove(sectionKey);
              } else {
                updatedData[sectionKey] = newValue;
              }
              evolution.value = evolution.value.copyWith(data: updatedData);
              return;
            }

            final sectionMap = Map<String, dynamic>.from(
              updatedData[sectionKey] as Map? ?? {},
            );

            // Handle 2-level (sectionKey > typeName)
            if (itemKey == null) {
              if (newValue == null) {
                sectionMap.remove(typeName);
              } else {
                sectionMap[typeName] = newValue;
              }
              updatedData[sectionKey] = sectionMap;

              evolution.value = evolution.value.copyWith(data: updatedData);
              return;
            }

            final typeMap = Map<String, dynamic>.from(
              sectionMap[typeName] as Map? ?? {},
            );

            // Handle 3-level (sectionKey > typeName > itemKey)
            if (optionKey == null) {
              if (newValue == null) {
                typeMap.remove(itemKey);
              } else {
                typeMap[itemKey] = newValue;
              }
              sectionMap[typeName] = typeMap;
              updatedData[sectionKey] = sectionMap;
              evolution.value = evolution.value.copyWith(data: updatedData);
              return;
            }

            final itemMap = Map<String, dynamic>.from(
              typeMap[itemKey] as Map? ?? {},
            );

            // Handle 4-level (sectionKey > typeName > itemKey > optionKey)
            if (newValue == null) {
              itemMap.remove(optionKey);
            } else {
              itemMap[optionKey] = newValue;
            }

            typeMap[itemKey] = itemMap;
            sectionMap[typeName] = typeMap;
            updatedData[sectionKey] = sectionMap;

            evolution.value = evolution.value.copyWith(data: updatedData);
          }

          return AbsorbPointer(
            absorbing: loading.value,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      assessment.sections.map((section) {
                        section.elements.sort(
                          (a, b) => a.index.compareTo(b.index),
                        );
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            if (section.name != null)
                              Text(
                                section.name!,
                                style: context.style.titleLarge,
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  section.elements.map((e) {
                                    return Column(
                                      spacing: 12,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (e.instruction != null)
                                          Text(
                                            e.instruction!,
                                            style: context.style.bodySmall
                                                ?.copyWith(
                                                  color: context.scheme.outline,
                                                ),
                                          ),
                                        switch (e.type) {
                                          AssessmentElementType.quiz => Builder(
                                            builder: (context) {
                                              final quizItems =
                                                  (e.value as Iterable)
                                                      .map(
                                                        (e) =>
                                                            QuizItem.fromJson(
                                                              e,
                                                            ),
                                                      )
                                                      .toList()
                                                    ..sort(
                                                      (a, b) => a.index
                                                          .compareTo(b.index),
                                                    );
                                              return Column(
                                                spacing: 12,
                                                children:
                                                    quizItems
                                                        .map(
                                                          (i) => Column(
                                                            spacing: 8,
                                                            children: [
                                                              if (i.question !=
                                                                  null)
                                                                Text(
                                                                  i.question!,
                                                                ),
                                                              switch (i.type) {
                                                                QuizItemType.shortAnswer => TextFormField(
                                                                  inputFormatters: [
                                                                    LengthLimitingTextInputFormatter(
                                                                      100,
                                                                    ),
                                                                  ],
                                                                  initialValue:
                                                                      getNestedValue(
                                                                        section
                                                                            .key,
                                                                        typeName:
                                                                            e.type.name,
                                                                        itemKey:
                                                                            i.key,
                                                                      ),
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .sentences,
                                                                  onChanged: (
                                                                    value,
                                                                  ) {
                                                                    updateNestedValue(
                                                                      sectionKey:
                                                                          section
                                                                              .key,
                                                                      typeName:
                                                                          e.type.name,
                                                                      itemKey:
                                                                          i.key,
                                                                      newValue:
                                                                          value,
                                                                    );
                                                                  },
                                                                ),
                                                                QuizItemType.longAnswer => TextFormField(
                                                                  minLines: 5,
                                                                  maxLines: 10,
                                                                  inputFormatters: [
                                                                    LengthLimitingTextInputFormatter(
                                                                      1000,
                                                                    ),
                                                                  ],
                                                                  initialValue:
                                                                      getNestedValue(
                                                                        section
                                                                            .key,
                                                                        typeName:
                                                                            e.type.name,
                                                                        itemKey:
                                                                            i.key,
                                                                      ),
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .sentences,
                                                                  onChanged: (
                                                                    value,
                                                                  ) {
                                                                    updateNestedValue(
                                                                      sectionKey:
                                                                          section
                                                                              .key,
                                                                      typeName:
                                                                          e.type.name,
                                                                      itemKey:
                                                                          i.key,
                                                                      newValue:
                                                                          value,
                                                                    );
                                                                  },
                                                                ),
                                                                QuizItemType.multipleShortAnswers => Builder(
                                                                  builder: (
                                                                    context,
                                                                  ) {
                                                                    final values =
                                                                        getNestedValue(
                                                                              section.key,
                                                                              typeName:
                                                                                  e.type.name,
                                                                              itemKey:
                                                                                  i.key,
                                                                            )
                                                                            as Iterable? ??
                                                                        [''];
                                                                    return Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          spacing:
                                                                              8,
                                                                          children: List.generate(
                                                                            values.length,
                                                                            (
                                                                              index,
                                                                            ) => Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    textCapitalization:
                                                                                        TextCapitalization.sentences,
                                                                                    inputFormatters: [
                                                                                      LengthLimitingTextInputFormatter(
                                                                                        50,
                                                                                      ),
                                                                                    ],
                                                                                    initialValue:
                                                                                        values
                                                                                            .elementAt(
                                                                                              index,
                                                                                            )
                                                                                            ?.toString(),
                                                                                    onChanged: (
                                                                                      value,
                                                                                    ) {
                                                                                      updateNestedValue(
                                                                                        sectionKey:
                                                                                            section.key,
                                                                                        typeName:
                                                                                            e.type.name,
                                                                                        itemKey:
                                                                                            i.key,
                                                                                        newValue: [
                                                                                            ...values,
                                                                                          ]
                                                                                          ..[index] =
                                                                                              value,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    updateNestedValue(
                                                                                      sectionKey:
                                                                                          section.key,
                                                                                      typeName:
                                                                                          e.type.name,
                                                                                      itemKey:
                                                                                          i.key,
                                                                                      newValue: [
                                                                                        ...values,
                                                                                      ].removeAt(
                                                                                        index,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  icon: const Icon(
                                                                                    Icons.clear_rounded,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (values.length <
                                                                            10)
                                                                          TextButton.icon(
                                                                            onPressed: () {
                                                                              updateNestedValue(
                                                                                sectionKey:
                                                                                    section.key,
                                                                                typeName:
                                                                                    e.type.name,
                                                                                itemKey:
                                                                                    i.key,
                                                                                newValue: [
                                                                                  ...values,

                                                                                  '',
                                                                                ],
                                                                              );
                                                                            },
                                                                            label: Text(
                                                                              'Add',
                                                                            ),
                                                                            icon: Icon(
                                                                              Icons.add_rounded,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                QuizItemType.trueFalse => Row(
                                                                  spacing: 16,
                                                                  children:
                                                                      [true, false]
                                                                          .map(
                                                                            (
                                                                              v,
                                                                            ) => Row(
                                                                              children: [
                                                                                Radio<
                                                                                  bool
                                                                                >(
                                                                                  value:
                                                                                      v,
                                                                                  groupValue: getNestedValue(
                                                                                    section.key,
                                                                                    typeName:
                                                                                        e.type.name,
                                                                                    itemKey:
                                                                                        i.key,
                                                                                  ),
                                                                                  onChanged: (
                                                                                    value,
                                                                                  ) {
                                                                                    updateNestedValue(
                                                                                      sectionKey:
                                                                                          section.key,
                                                                                      typeName:
                                                                                          e.type.name,
                                                                                      itemKey:
                                                                                          i.key,
                                                                                      newValue:
                                                                                          value,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  v
                                                                                      ? 'True'
                                                                                      : 'False',
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                          .toList(),
                                                                ),
                                                                QuizItemType.choice => Column(
                                                                  children:
                                                                      (i.options ??
                                                                              [])
                                                                          .map(
                                                                            (
                                                                              o,
                                                                            ) => RadioListTile(
                                                                              title: Text(
                                                                                o.value,
                                                                              ),
                                                                              value:
                                                                                  o.key,
                                                                              groupValue: getNestedValue(
                                                                                section.key,
                                                                                typeName:
                                                                                    e.type.name,
                                                                                itemKey:
                                                                                    i.key,
                                                                              ),
                                                                              onChanged: (
                                                                                v,
                                                                              ) {
                                                                                updateNestedValue(
                                                                                  sectionKey:
                                                                                      section.key,
                                                                                  typeName:
                                                                                      e.type.name,
                                                                                  itemKey:
                                                                                      i.key,
                                                                                  newValue:
                                                                                      o.key,
                                                                                );
                                                                              },
                                                                            ),
                                                                          )
                                                                          .toList(),
                                                                ),
                                                                QuizItemType.multipleChoice => Builder(
                                                                  builder: (
                                                                    context,
                                                                  ) {
                                                                    final values =
                                                                        getNestedValue(
                                                                              section.key,
                                                                              typeName:
                                                                                  e.type.name,
                                                                              itemKey:
                                                                                  i.key,
                                                                            )
                                                                            as Iterable? ??
                                                                        [];
                                                                    return Column(
                                                                      children:
                                                                          (i.options ??
                                                                                  [])
                                                                              .map(
                                                                                (
                                                                                  o,
                                                                                ) => CheckboxListTile(
                                                                                  title: Text(
                                                                                    o.value,
                                                                                  ),
                                                                                  value: values.contains(
                                                                                    o.key,
                                                                                  ),
                                                                                  onChanged: (
                                                                                    v,
                                                                                  ) {
                                                                                    updateNestedValue(
                                                                                      sectionKey:
                                                                                          section.key,
                                                                                      typeName:
                                                                                          e.type.name,
                                                                                      itemKey:
                                                                                          i.key,
                                                                                      newValue: {
                                                                                        ...values,
                                                                                        o.key,
                                                                                      }..removeWhere(
                                                                                        (
                                                                                          k,
                                                                                        ) =>
                                                                                            v !=
                                                                                                    true
                                                                                                ? k ==
                                                                                                    o.key
                                                                                                : false,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              )
                                                                              .toList(),
                                                                    );
                                                                  },
                                                                ),
                                                                _ => SizedBox(),
                                                              },
                                                            ],
                                                          ),
                                                        )
                                                        .toList(),
                                              );
                                            },
                                          ),
                                          AssessmentElementType.likeart => Builder(
                                            builder: (context) {
                                              final likeartItems =
                                                  (e.value as Iterable)
                                                      .map(
                                                        (e) =>
                                                            LikeartItem.fromJson(
                                                              e,
                                                            ),
                                                      )
                                                      .toList()
                                                    ..sort(
                                                      (a, b) => a.index
                                                          .compareTo(b.index),
                                                    );

                                              return Column(
                                                spacing: 12,
                                                children:
                                                    likeartItems.map((i) {
                                                      final value =
                                                          getNestedValue(
                                                            section.key,
                                                            typeName:
                                                                e.type.name,
                                                            itemKey: i.key,
                                                          );
                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        spacing: 8,
                                                        children: [
                                                          Text(i.value),
                                                          LikeartAnswerSelectionView(
                                                            onChanged: (value) {
                                                              updateNestedValue(
                                                                sectionKey:
                                                                    section.key,
                                                                typeName:
                                                                    e.type.name,
                                                                itemKey: i.key,
                                                                newValue:
                                                                    value
                                                                        ?.value,
                                                              );
                                                            },
                                                            selected:
                                                                value is String
                                                                    ? LikeartAnswer(
                                                                      value,
                                                                    )
                                                                    : null,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                              );
                                            },
                                          ),
                                          _ => SizedBox(),
                                        },
                                      ],
                                    );
                                  }).toList(),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
