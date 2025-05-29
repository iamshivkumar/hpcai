import 'package:ai_school/core/models/teacher.dart';
import 'package:ai_school/core/repositories/teacher_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cross_file/cross_file.dart'; // For XFile

class WriteTeacherDialog extends HookConsumerWidget {
  const WriteTeacherDialog({super.key, this.initial});

  final Teacher? initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController(text: initial?.name ?? '');
    final sign = useState<XFile?>(null); // Updated to XFile? for file upload
    final loading = useState(false);
    final user = ref.read(sessionProvider)!;

    Future<String?> uploadFile(XFile? file, String path) async {
      if (file == null) return null;
      // final ref = FirebaseStorage.instance.ref().child(path);
      // await ref.putFile(File(file.path));
      // return await ref.getDownloadURL();
    }

    final repo = ref.read(teacherRepositoryProvider);

    final edit = initial != null;

    Future<void> saveTeacher() async {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;
      try {
        var updatedTeacher =
            initial?.copyWith(name: nameController.text.trim()) ??
            Teacher(
              id: '',
              schoolId: user.schoolId!,
              name: nameController.text.trim(),
            );

        if (edit) {
          updatedTeacher = await repo.updateTeacher(
            updatedTeacher.id,
            updatedTeacher,
          );
        } else {
          updatedTeacher = await repo.createTeacher(updatedTeacher);
        }

        Navigator.pop(context, updatedTeacher);
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    return Dialog(
      insetPadding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${edit ? 'Edit' : 'Add'} Teacher',
                style: context.style.titleLarge,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name*',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Please enter a name'
                            : null,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   spacing: 8,
              //   children: [
              //     const Text('Teacher Sign'),
              //     ImagePickerView(
              //       height: 100,
              //       width: 200,
              //       file: sign.value, // Pass file path to ImagePickerView
              //       url: initial?.sign, // Existing URL if editing
              //       fit: BoxFit.contain,
              //       cropAspectRatio: 2,
              //       onPick:
              //           (v) => sign.value = v, // Convert picked file to XFile
              //       onRemove: () => sign.value = null,
              //     ),
              //   ],
              // ),
              FilledButton(
                onPressed: loading.value ? null : saveTeacher,
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
