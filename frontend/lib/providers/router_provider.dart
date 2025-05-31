import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/features/activities/write_activity_page.dart';
import 'package:ai_school/features/assessments/activity_assessments_page.dart';
import 'package:ai_school/features/assessments/assessment_page.dart';
import 'package:ai_school/features/assessments/evolution_page.dart';
import 'package:ai_school/features/assessments/fillup_assessment_page.dart';
import 'package:ai_school/features/groups/write_group_page.dart';
import 'package:ai_school/features/root/root.dart';
import 'package:ai_school/features/students/students_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    redirect: (context, state) async {
      // final cache =  ref.read(cacheProvider);
      // final session = cache.currentSession;

      // if (session == null) {
      //   return '/login';
      // } else if (state.matchedLocation == '/login') {
      //   return '/';
      // }
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => Root()),
      GoRoute(
        path: '/students',
        builder: (context, state) => StudentsPage(class$: state.extra as Class),
      ),
      GoRoute(
        path: '/write-group',
        builder:
            (context, state) =>
                WriteGroupPage(args: state.extra as WriteGroupPageArgs),
      ),


            GoRoute(
        path: '/write-activity',
        builder:
            (context, state) =>
                WriteActivityPage(args: state.extra as WriteActivityPageArgs),
      ),

      GoRoute(
        path: '/assessment',
        builder:
            (context, state) =>
                AssessmentPage(args: state.extra as AssessmentPageArgs),
      ),

      GoRoute(
        path: '/fillup-assessment',
        builder:
            (context, state) => FillupAssessmentPage(
              args: state.extra as FillupAssessmentPageArgs,
            ),
      ),

      GoRoute(
        path: '/activity-assessments',
        builder:
            (context, state) => ActivityAssessmentsPage(
              args: state.extra as ActivityAssessmentsPageArgs,
            ),
      ),

      GoRoute(
        path: '/evolution',
        builder:
            (context, state) =>
                EvolutionPage(args: state.extra as EvolutionPageArgs),
      ),

      // /fillup-assessment
    ],
  );
});
