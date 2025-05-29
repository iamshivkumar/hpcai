


import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AccountButton extends ConsumerWidget {
  const AccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return PopupMenuButton(
      icon: const Icon(Icons.account_circle_outlined),
      onSelected: (value) async {
        if (value == 'logout') {
          // final user = ref.read(sessionProvider)!.user;
          // ref.read(authRepositoryProvider).update(
          //       user.id,
          //       user.copyWith(fcmToken: null),
          //     );
          await ref.read(cacheProvider).setSession(null);
          ref.refresh(sessionProvider);
          context.go('/login');
        }
        // else if (value == 'institute') {
        //   showDialog(
        //     context: context,
        //     builder: (context) => InstituePage(),
        //   );
        // } else if (value == 'profile') {
        //   showDialog(
        //     context: context,
        //     builder: (context) => ProfilePage(),
        //   );
        // }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'logout',
          child: Text('Logout'),
        ),
        // const PopupMenuItem(
        //   value: 'institute',
        //   child: Text('Your institute'),
        // ),
        // const PopupMenuItem(
        //   value: 'profile',
        //   child: Text('Your profile'),
        // ),
      ],
    );
  }
}
