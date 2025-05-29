// ignore_for_file: depend_on_referenced_packages

import 'package:ai_school/core/models/teacher.dart';
import 'package:ai_school/core/repositories/teacher_repository.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/teachers/providers/teachers_provider.dart';
import 'package:ai_school/features/teachers/widgets/write_teacher_dialog.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class TeachersSearchDelegate extends SearchDelegate {
  TeachersSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          showSuggestions(context);
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  Widget view(BuildContext context) {
    return Material(
      color: context.scheme.surfaceContainerLowest,
      child: SafeArea(
        child: HookConsumer(
          builder: (context, ref, child) {
            final notifier  = ref.read(teachersProvider.notifier);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Select teacher',
                    style: context.style.titleMedium?.copyWith(
                      color: context.scheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: AsyncWidget(
                    value: ref.watch(teachersProvider), // Provider for teachers list
                    data: (data) {
                      final filteredData = data
                          .where((teacher) =>
                              teacher.name.toLowerCase().contains(query.toLowerCase()))
                          .toList();
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final teacher = filteredData[index];
                          return ListTile(
                            title: Text(teacher.name),
                            onTap: () {
                              close(context, teacher);
                            },
                            trailing: PopupMenuButton(
                              onSelected: (value) async {
                                if (value == 'view') {
                                  context.push(
                                    '/teacher-details',
                                    extra: teacher,
                                  );
                                } else if (value == 'edit') {
                                  final updatedTeacher = await showDialog<Teacher>(
                                    context: context,
                                    builder: (context) => WriteTeacherDialog(initial: teacher),
                                  );
                                  if (updatedTeacher != null) {
                                   notifier.sync(updatedTeacher);
                                  }
                                } else if (value == 'delete') {
                                  final value = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Delete ${teacher.name}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: context.scheme.error,
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
                                      await ref.read(teacherRepositoryProvider).deleteTeacher(teacher.id);
                                    ref.read(teachersProvider.notifier).remove(teacher.id);
                                    } catch (e) {
                                      context.error(e);
                                    }
                                  }
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'view',
                                  child: Text('View Details'),
                                ),
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
                          );
                        },
                        itemCount: filteredData.length,
                      );
                    },
                  ),
                ),
                BottomButtonWrapper(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final newTeacher = await showDialog<Teacher>(
                        context: context,
                        builder: (context) => const WriteTeacherDialog(),
                      );
                      if (newTeacher != null) {
                        notifier.sync(newTeacher);
                      }
                    },
                    label: Text('Add new teacher'),
                    icon: Icon(Icons.add_rounded),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return view(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return view(context);
  }
}