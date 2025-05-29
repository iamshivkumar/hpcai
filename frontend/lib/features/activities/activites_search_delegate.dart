// ignore_for_file: depend_on_referenced_packages

import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/core/repositories/activity_repository.dart';
import 'package:ai_school/features/activities/providers/activities_provider.dart';
import 'package:ai_school/features/activities/write_activities_page.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActivitiesSearchDelegate extends SearchDelegate {
  ActivitiesSearchDelegate({required this.area, required this.grade});

  final Area area;
  final Grade grade;

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
            final provider = activitiesProvider(grade, area);
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
                    'Select activity to start or schedule',
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
                          final activity = data[index];
                          return ListTile(
                            title: Text(activity.title),
                            onTap: () {
                              close(context, activity);
                            },
                            trailing: PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              onSelected: (value) async {
                                if (value == 'view') {
                                  context.push(
                                    '/activity-details',
                                    extra: activity,
                                  );
                                } else if (value == 'edit') {
                                  context.push(
                                    '/write-activity',
                                    extra: WriteActivityPageArgs(
                                      area: area,
                                      grade: grade,
                                      initial: activity,
                                    ),
                                  );
                                } else if (value == 'delete') {
                                  final value = await showDialog(
                                    context: context,
                                    builder:
                                        (context) => AlertDialog(
                                          title: Text(
                                            'Delete ${activity.label}?',
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
                                      await ref.read(activityRepositoryProvider).deleteActivity(activity.id);
                                      notifier.remove(activity.id);
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
                      context.push(
                        '/write-activity',
                        extra: WriteActivityPageArgs(
                          area: area,
                          grade: grade,
                        ),
                      );
                    },
                    label: Text('Create new activity'),
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
