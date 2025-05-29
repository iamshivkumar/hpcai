import 'package:ai_school/features/classes/classes_page.dart';
import 'package:ai_school/features/dashboard/providers/index_provider.dart';
import 'package:ai_school/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);
    return Scaffold(
      body: [
        HomePage(),
        ClassesPage(),
        Scaffold(),
        Scaffold(),
      ][index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.class_outlined),
            selectedIcon: Icon(Icons.class_rounded),
            label: 'Classes',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.calendar_month_outlined),
          //   selectedIcon: Icon(Icons.calendar_month_rounded),
          //   label: 'Calendar',
          // ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        onDestinationSelected: (value) {
          ref.read(indexProvider.notifier).state = value;
        },
      ),
    );
  }
}
