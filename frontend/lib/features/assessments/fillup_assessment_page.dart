import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/repositories/assessment_repository.dart';
import 'package:ai_school/features/assessments/assessment_page.dart';
import 'package:ai_school/features/assessments/providers/assessments_provider.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FillupAssessmentPageArgs {
  const FillupAssessmentPageArgs({required this.type, required this.class$});
  final AssessmentType type;
  final Class class$;
}

class FillupAssessmentPage extends HookConsumerWidget {
  const FillupAssessmentPage({super.key, required this.args});
  final FillupAssessmentPageArgs args;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final provider = assessmentsProvider(
      classId: args.class$.id,
      type: args.type,
    );
    return AsyncPage(
      value: ref.watch(provider),
      data: (data) {
        final assessment = data.firstOrNull;

        if (assessment == null) {
          return Scaffold(
            appBar: AppBar(title: Text(args.type.label)),
            body: Center(
              child: FilledButton(
                onPressed:
                    loading.value
                        ? null
                        : () async {
                          try {
                            loading.value = true;
                            final generated = await ref
                                .read(assessmentRepositoryProvider)
                                .generateAssessment({
                                  ...Assessment(
                                    id: '',
                                    schoolId:
                                        ref.read(sessionProvider)!.schoolId!,
                                    classId: args.class$.id,
                                    type: args.type,
                                    name: '',
                                    medium: 'english',
                                  ).toJson(),
                                  'grade': args.class$.grade.value,
                                });
                            ref.read(provider.notifier).sync(generated);
                          } catch (e) {
                            context.error(e);
                          } finally {
                            loading.value = false;
                          }
                        },
                child: LoadingButtonTextWrapper(
                  loading: loading.value,
                  child: Text('Start'),
                ),
              ),
            ),
          );
        } else {
          return AssessmentPage(
            args: AssessmentPageArgs(
              class$: args.class$,
              assessment: assessment,
            ),
          );
        }
      },
      title: args.type.label,
    );
  }
}
