// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/features/activities/widgets/activity_header.dart';
import 'package:ai_school/features/assessments/providers/assessment_provider.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/groups/providers/groups_provider.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssessmentPageArgs {
  final Class class$;
  final Assessment session;

  AssessmentPageArgs({required this.class$, required this.session});
}

class AssessmentPage extends ConsumerWidget {
  const AssessmentPage({super.key, required this.args});

  final AssessmentPageArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessment =
        (args.session.type == AssessmentType.activity
            ? ref.watch(assessmentByIdProvider(args.session.id)).asData?.value
            : null) ??
        args.session;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.class$.label),
        bottom:
            assessment.activity != null
                ? ActivityHeader(activity: assessment.activity!)
                : null,
      ),
      body: AsyncWidget(
        value: ref.watch(studentsProvider(args.class$.id)),
        data: (students) {
          final group =
              args.session.groupId != null
                  ? ref
                      .watch(groupsProvider(args.class$.id))
                      .asData
                      ?.value
                      .where((e) => e.id == args.session.groupId)
                      .firstOrNull
                  : null;
          final filtered =
              students
                  .where(
                    (e) =>
                        args.session.groupId != null
                            ? (group?.studentIds.contains(e.id) ?? false)
                            : args.session.studentId != null
                            ? e.id == args.session.studentId
                            : true,
                  )
                  .toList();
          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final student = filtered[index];
              return ListTile(
                onTap: () async {
                  // final evolution = await ref.read(
                  //   evolutionProvider(args.session.id, student.id).future,
                  // );
                  // context.push(
                  //   '/write-evolution',
                  //   extra: EvolutionArgs(
                  //     activity: args.activity,
                  //     session: args.session,
                  //     student: student,
                  //     class$: args.class$,
                  //     initial: evolution,
                  //   ),
                  // );
                },
                title: Text(student.name),
                leading: CircleAvatar(child: Text('${student.rollNo}')),
                // trailing:  ProgressIcon(
                //   student.activities[args.activity.area]?[args.session.id],
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
