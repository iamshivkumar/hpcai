import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
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
    ],
  );
});
