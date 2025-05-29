import 'package:ai_school/features/auth/login_page.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/dashboard/dashboard.dart';
import 'package:ai_school/features/schools/write_school_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider);
    return user == null
            ? LoginPage()
            : user.schoolId == null? WriteSchoolPage(): Dashboard();
  }
}
