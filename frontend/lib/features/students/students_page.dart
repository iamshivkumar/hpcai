import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/core/repositories/student_repository.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/empty_message_view.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:ai_school/features/students/widgets/write_student_dialog.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({super.key, required this.class$});

  final Class class$;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = studentsProvider(class$.id);
    final notifier =  ref.read(provider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
         final value = await showDialog(
            context: context,
            builder: (context) => WriteStudentDialog(classId: class$.id),
          );
          if(value is Student){
           notifier.sync(value);
          }
        },
        child: Icon(Icons.add_rounded),
      ),
      body: AsyncWidget(
        value: ref.watch(provider),
        data: (data) {
          if (data.isEmpty) {
            return EmptyMessageView("You didn't added any student yet");
          }
          return ListView(
            children:
                data
                    .map(
                      (e) => ListTile(
                        title: Text(e.name),
                        leading: CircleAvatar(child: Text('${e.rollNo}')),
                        trailing: PopupMenuButton(
                          onSelected: (value) async {
                            if (value == 'edit') {
                             final updated = await showDialog(
                                context: context,
                                builder:
                                    (context) => WriteStudentDialog(
                                      classId: class$.id,
                                      initial: e,
                                    ),
                              );
                              if(updated is Student){
                                notifier.sync(updated);
                              }
                            } else if (value == 'delete') {
                              final value = await showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Delete ${e.rollNo} - ${e.name}?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                context.scheme.error,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                              );
                              if (value == true) {
                                try {
                                  await ref
                                      .read(studentRepositoryProvider)
                                      .deleteStudent(e.id);
                                  ref.read(provider.notifier).remove(e.id);
                                } catch (e) {
                                  context.error(e);
                                }
                              }
                            }
                          },
                          itemBuilder:
                              (context) => [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ],
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    );
  }
}
