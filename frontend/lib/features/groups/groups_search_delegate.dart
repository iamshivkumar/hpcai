// ignore_for_file: depend_on_referenced_packages

import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/group.dart';
import 'package:ai_school/core/repositories/group_repository.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/groups/providers/groups_provider.dart';
import 'package:ai_school/features/groups/write_group_page.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class GroupSearchDelegate extends SearchDelegate {
  GroupSearchDelegate({required this.class$});

  final Class class$;

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
            final provider  = groupsProvider(class$.id);
            final notifier = ref.read(provider.notifier);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Select group to start or schedule',
                    style: context.style.titleMedium?.copyWith(
                      color: context.scheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: AsyncWidget(
                    value: ref.watch(provider),
                    data: (data) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final group = data[index];
                          return ListTile(
                            title: Text(group.name),
                            subtitle: Row(
                              spacing: 12,
                              children: [
                                Text('${group.studentIds.length} students'),
                                Text(group.area?.label ?? ''),
                              ],
                            ),
                            onTap: () {
                              close(context, group);
                            },
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              onSelected: (value) async {
                                if (value == 'view') {
                                  context.push('/group-details', extra: group);
                                } else if (value == 'edit') {
                                 final value = await context.push(
                                    '/write-group',
                                    extra: WriteGroupPageArgs(
                                      initial: group,
                                      class$: class$,
                                    ),
                                  );
                                  if(value is Group){
                                    notifier.sync(value);
                                  }
                                } else if (value == 'delete') {
                                  final value = await showDialog(
                                    context: context,
                                    builder:
                                        (context) => AlertDialog(
                                          title: Text(
                                            'Delete ${group.name} group?',
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
                                      await ref.read(groupRepositoryProvider).deleteGroup(group.id);
                                    notifier.remove(group.id);
                                    } catch (e) {
                                      context.error(e);
                                    }
                                  }
                                }
                              },
                              itemBuilder:
                                  (context) => [
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
                        itemCount: data.length,
                      );
                    },
                  ),
                ),
                BottomButtonWrapper(
                  child: OutlinedButton.icon(
                    onPressed: () async{
                    final value = await  context.push(
                        '/write-group',
                        extra: WriteGroupPageArgs(class$: class$),
                      );
                      if(value is Group){
                        notifier.sync(value);
                      }
                    },
                    label: Text('Create new group'),
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
