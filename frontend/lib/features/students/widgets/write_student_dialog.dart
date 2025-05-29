import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/core/repositories/student_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteStudentDialog extends HookConsumerWidget {
  const WriteStudentDialog({super.key, this.initial,required this.classId});

  final Student? initial;

  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController(text: initial?.name ?? '');
    final rollNoController = useTextEditingController(text: initial?.rollNo.toString() ?? '');
    final loading = useState(false);
    final user = ref.read(sessionProvider)!;

    final repo = ref.read(studentRepositoryProvider);

    final edit = initial != null;


    Future<void> saveStudent() async {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;
      try {


        var updatedStudent = initial?.copyWith(
              name: nameController.text.trim(),
              rollNo: int.parse(rollNoController.text.trim()),
            ) ??
            Student(
              id: '',
              schoolId: user.schoolId!,
              name: nameController.text.trim(),
              rollNo: int.parse(rollNoController.text.trim()),
              classId: classId,
            );


                    if (edit) {
          updatedStudent = await repo.updateStudent(
            updatedStudent.id,
            updatedStudent,
          );
        } else {
          updatedStudent = await repo.createStudent(updatedStudent);
        }


        Navigator.pop(context, updatedStudent);
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Text(
                '${edit ? 'Edit' : 'Add'} student',
                style: context.style.titleLarge,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name*'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
              ),
              TextFormField(
                controller: rollNoController,
                decoration: const InputDecoration(labelText: 'Roll Number*'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) => value!.isEmpty ? 'Please enter a roll number' : int.tryParse(value) == null? 'Enter valid number': null,
              ),
              FilledButton(
                onPressed: loading.value ? null : saveStudent,
                child: LoadingButtonTextWrapper(
                  loading: loading.value,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
