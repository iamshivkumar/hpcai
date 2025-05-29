import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/repositories/class_repository.dart';
import 'package:ai_school/features/classes/providers/classes_provider.dart';
import 'package:ai_school/features/classes/widgets/write_class_dialog.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClassesPage extends ConsumerWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref
                                      .read(classesProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Classes')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
        final value = await  showDialog(
            context: context,
            builder: (context) => WriteClassDialog(),
          );
          if(value is Class){
            notifier.sync(value);
          }
        },
        child: Icon(Icons.add_rounded),
      ),
      body: AsyncWidget(
        value: ref.watch(classesProvider),
        data: (data) {
          return ListView(
            children:
                data
                    .map(
                      (e) => ListTile(
                        title: Text(e.label),
                        trailing: PopupMenuButton(
                          onSelected: (value) async {
                            if (value == 'edit') {
                             final value = await showDialog(
                                context: context,
                                builder:
                                    (context) => WriteClassDialog(initial: e),
                                  
                              );
                              if(value is Class){
                                notifier.sync(value);
                              }
                            } else if (value == 'delete') {
                              final value = await showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text('Delete ${e.label}?'),
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
                                      .read(classRepositoryProvider)
                                      .deleteClass(e.id);
                                  
                                      notifier.remove(e.id);
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
