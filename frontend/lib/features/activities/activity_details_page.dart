import 'package:ai_school/core/data.dart';
import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/rubric.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/tag_text.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ActivityDetailsPage extends HookConsumerWidget {
  const ActivityDetailsPage({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(sessionProvider)!;
    final isCreator = user.schoolId == activity.schoolId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        actions: [
          if (isCreator)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                context.push('/write-activity', extra: activity);
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            // Title
            Text(
              activity.title,
              style: context.style.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            // Domain
            Row(
              children: [
                Text(
                  'Domain: ',
                  style: context.style.titleMedium,
                ),
                Text(
                  activity.area.label,
                  style: context.style.bodyLarge,
                ),
              ],
            ),

            // Grade (if exists)
            // if (activity.grade != null)
              Row(
                children: [
                  Text(
                    'Grade: ',
                    style: context.style.titleMedium,
                  ),
                  Text(
                    activity.grade.label,
                    style: context.style.bodyLarge,
                  ),
                ],
              ),

            // Goals
            if (activity.goals.isNotEmpty) ...[
              Text('Curricular Goals', style: context.style.titleMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: activity.goals
                    .map((e) => TagText(tag: e, text: Data.getGoal(e)))
                    .toList(),
              ),
            ],

            // Competencies
            if (activity.competencies.isNotEmpty) ...[
              Text('Competencies', style: context.style.titleMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: activity.competencies
                    .map((e) => TagText(tag: e, text: Data.getCompetency(e)))
                    .toList(),
              ),
            ],

            // Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text('Description', style: context.style.titleMedium),
                Text(
                  activity.description,
                  style: context.style.bodyLarge,
                ),
              ],
            ),

            // Questions
            if (activity.questions != null && activity.questions!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('Questions', style: context.style.titleMedium),
                  Text(
                    activity.questions!.join(',\n'),
                    style: context.style.bodyLarge,
                  ),
                ],
              ),

            // Rubric
            if (activity.rubric.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text('Rubric', style: context.style.titleMedium),
                  ...RubricAbility.values.map(
                    (ability) => activity.rubric[ability] != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Text(
                                ability.name.capLabel,
                                style: context.style.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.scheme.primary,
                                ),
                              ),
                              ...RubricLevel.values.map(
                                (level) => activity.rubric[ability]![level] != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 4,
                                        children: [
                                          Text(
                                            level.name.capLabel,
                                            style: context.style.bodyMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            activity.rubric[ability]![level]!,
                                            style: context.style.bodyMedium,
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),

            
          ],
        ),
      ),
    );
  }
}