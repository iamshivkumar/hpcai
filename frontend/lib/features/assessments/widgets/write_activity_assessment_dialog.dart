import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/group.dart';
import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/core/repositories/assessment_repository.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/groups/groups_search_delegate.dart';
import 'package:ai_school/features/groups/providers/groups_provider.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:ai_school/features/students/student_search_delegate.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteActivityAssessmentDialog extends HookConsumerWidget {
  const WriteActivityAssessmentDialog({super.key, required this.initial,required this.class$});

  final Assessment initial;

  final Class class$;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final groupId = useState(initial.groupId);
    final studentId = useState(initial.studentId);
    final loading = useState(false);

    final type = useState(
      initial.studentId != null
          ? 'Individual'
          : initial.groupId != null
          ? 'Group'
          : 'Class',
    );

    final edit = initial.id.isNotEmpty;

    const types = ['Class', 'Group', 'Individual'];

    final repo = ref.read(assessmentRepositoryProvider);

    Future<void> saveSession() async {
      loading.value = true;
      try {
        var updated = initial.copyWith(
          // grade: class$.grade,
          groupId: type.value == 'Group' ? groupId.value : null,
          studentId: type.value == 'Individual' ? studentId.value : null,
        );

        if(edit){
          updated = await repo.updateAssessment(initial.id, updated);
        } else {
          updated = await repo.generateAssessment({
            ...updated.toJson(),
            'grade': class$.grade.value,
          });
        }

        Navigator.pop(context, updated);
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(initial.name, style: context.style.titleLarge),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Type*'),
                value: types.contains(type.value) ? type.value : null,
                items:
                    types
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                onChanged: (value) {
                  type.value = value!;
                },
                validator:
                    (value) => value!.isEmpty ? 'Please select a type' : null,
              ),

              // TextFormField(
              //   readOnly: true,
              //   decoration: const InputDecoration(labelText: 'Date & Time*'),
              //   controller: TextEditingController(
              //     text:
              //         at.value != null
              //             ? DateFormat.yMMMd().add_jm().format(at.value!)
              //             : '',
              //   ),
              //   onTap: () async {
              //     final picked = await showDatePicker(
              //       context: context,
              //       initialDate: at.value ?? DateTime.now(),
              //       firstDate: DateTime(2000),
              //       lastDate: DateTime(2100),
              //     );
              //     if (picked != null) {
              //       final time = await showTimePicker(
              //         context: context,
              //         initialTime: TimeOfDay.fromDateTime(
              //           at.value ?? DateTime.now(),
              //         ),
              //       );
              //       if (time != null) {
              //         at.value = DateTime(
              //           picked.year,
              //           picked.month,
              //           picked.day,
              //           time.hour,
              //           time.minute,
              //         );
              //       }
              //     }
              //   },
              //   validator:
              //       (value) =>
              //           value!.isEmpty ? 'Please select a date and time' : null,
              // ),
              if (type.value == 'Group')
                Builder(
                  builder: (context) {
                    final groups =
                        ref.watch(groupsProvider(class$.id)).asData?.value ??
                        [];
                    return TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: 'Group*'),
                      controller: TextEditingController(
                        text:
                            groups
                                .where((e) => e.id == groupId.value)
                                .firstOrNull
                                ?.name ??
                            '',
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Please select a group' : null,
                      onTap: () async {
                        final group = await showSearch(
                          context: context,
                          delegate: GroupSearchDelegate(class$: class$),
                        );
                        if (group is Group) {
                          groupId.value = group.id;
                        }
                      },
                    );
                  },
                ),
              if (type.value == 'Individual')
                Builder(
                  builder: (context) {
                    final students =
                        ref.watch(studentsProvider(class$.id)).asData?.value ??
                        [];
                    return TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: 'Student*'),
                      controller: TextEditingController(
                        text:
                            students
                                .where((e) => e.id == studentId.value)
                                .firstOrNull
                                ?.name ??
                            '',
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Please select a student' : null,
                      onTap: () async {
                        final student = await showSearch(
                          context: context,
                          delegate: StudentSearchDelegate(classId: class$.id),
                        );
                        if (student is Student) {
                          studentId.value = student.id;
                        }
                      },
                    );
                  },
                ),
              FilledButton(
                onPressed: loading.value ? null : saveSession,
                child: LoadingButtonTextWrapper(
                  loading: loading.value,
                  child: Text(edit ? 'Save' : 'Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
