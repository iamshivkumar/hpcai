// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/group.dart';
import 'package:ai_school/core/repositories/group_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/components/tag_text.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:ai_school/features/students/student_search_delegate.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteGroupPageArgs {
  final Class class$;
  final Group? initial;

  WriteGroupPageArgs({required this.class$, this.initial});
}

class WriteGroupPage extends HookConsumerWidget {
  const WriteGroupPage({super.key, required this.args});

  final WriteGroupPageArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(sessionProvider)!;
    final group = useRef(
      args.initial ??
          Group(
            id: '',
            classId: args.class$.id,
            schoolId: user.schoolId!,
            name: '',
            studentIds: [],
          ),
    );

    final edit = args.initial != null;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final loading = useState(false);

    final repo = ref.read(groupRepositoryProvider);

    Future<void> saveStudent() async {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;
      try {
        var updated = group.value;
        if (edit) {
          updated = await repo.updateGroup(updated.id, updated);
        } else {
          updated = await repo.createGroup(updated);
        }
        context.pop(updated);
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    final build = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('${edit ? 'Edit' : 'Create'} Group - ${args.class$.label}'),
      ),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton(
          onPressed: loading.value ? null : saveStudent,
          child: LoadingButtonTextWrapper(
            loading: loading.value,
            child: const Text('Save'),
          ),
        ),
      ),
      body: AbsorbPointer(
        absorbing: loading.value,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Group name*'),

                  initialValue: group.value.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                  onChanged:
                      (v) => group.value = group.value.copyWith(name: v.trim()),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                DropdownButtonFormField<Area>(
                  value: group.value.area,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Domain/Subject (optional)',
                  ),
                  items:
                      Area.list(args.class$.grade).map((area) {
                        return DropdownMenuItem(
                          value: area,
                          child: Text(area.label),
                        );
                      }).toList(),
                  onChanged:
                      (value) =>
                          group.value = group.value.copyWith(area: value!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    Text('Students', style: context.style.titleSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          group.value.studentIds.map((e) {
                            final student =
                                ref
                                    .read(studentsProvider(args.class$.id))
                                    .asData
                                    ?.value
                                    .where((s) => s.id == e)
                                    .firstOrNull;
                            return TagText(
                              tag: student?.rollNo.toString() ?? '?',
                              text: student?.name ?? '?',
                            );
                          }).toList(),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        final value = await showSearch(
                          context: context,
                          delegate: StudentSearchDelegate(
                            classId: group.value.classId,
                            selected: group.value.studentIds,
                          ),
                        );

                        if (value is List<String>) {
                          group.value = group.value.copyWith(studentIds: value);
                          build.value++;
                        }
                      },
                      label: Text(
                        group.value.studentIds.isEmpty
                            ? 'Add Students'
                            : 'Edit Students',
                      ),
                      icon: Icon(
                        group.value.studentIds.isEmpty
                            ? Icons.add_rounded
                            : Icons.edit_rounded,
                      ),
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
