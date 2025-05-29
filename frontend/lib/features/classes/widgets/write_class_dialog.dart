import 'package:ai_school/core/enums/grade.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/teacher.dart';
import 'package:ai_school/core/repositories/class_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/teachers/providers/teachers_provider.dart';
import 'package:ai_school/features/teachers/search_teacher_delegate.dart';
import 'package:ai_school/utils/dates.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteClassDialog extends HookConsumerWidget {
  const WriteClassDialog({super.key, this.initial});

  final Class? initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final grade = useState<Grade?>(initial?.grade);
    final sectionController = useTextEditingController(
      text: initial?.section ?? '',
    );

    final teacherId = useState(initial?.teacherId);
    final loading = useState(false);
    final user = ref.read(sessionProvider)!;

    final teacher =
        ref
            .watch(teachersProvider)
            .asData
            ?.value
            .where((e) => e.id == teacherId.value)
            .firstOrNull;

    final repo = ref.read(classRepositoryProvider);

    final edit = initial != null;

    Future<void> saveClass() async {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;
      try {
        final section = sectionController.text.crim;

        var updatedClass =
            initial?.copyWith(
              grade: grade.value!,
              section: section,
              teacherId: teacherId.value,
            ) ??
            Class(
              id: '',
              schoolId: user.schoolId!,
              grade: grade.value!,
              section: sectionController.text.crim,
              year: Dates.currentYear(),
              areas: [],
              teacherId: teacherId.value,
            );

        if (edit) {
          updatedClass = await repo.updateClass(updatedClass.id, updatedClass);
        } else {
          updatedClass = await repo.createClass(updatedClass);
        }

        Navigator.pop(context, updatedClass);
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
              Text(
                '${edit ? 'Edit' : 'Add'} class',
                style: context.style.titleLarge,
              ),
              DropdownButtonFormField<Grade>(
                value: grade.value,
                decoration: const InputDecoration(labelText: 'Grade*'),
                items:
                    Grade.values
                        .map(
                          (g) =>
                              DropdownMenuItem(value: g, child: Text(g.label)),
                        )
                        .toList(),
                onChanged: (value) => grade.value = value,
                validator:
                    (value) => value == null ? 'Please select a grade' : null,
              ),
              TextFormField(
                controller: sectionController,
                decoration: const InputDecoration(labelText: 'Section'),
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: teacher?.name),
                decoration: const InputDecoration(labelText: 'Teacher'),
                onTap: () async {
                  final picked = await showSearch(
                    context: context,
                    delegate: TeachersSearchDelegate(),
                  );
                  if (picked is Teacher) {
                    teacherId.value = picked.id;
                  }
                },
              ),
              FilledButton(
                onPressed: loading.value ? null : saveClass,
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
