import 'package:ai_school/config.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/providers/router_provider.dart';
import 'package:ai_school/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.dev();

  final cache = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [cacheProvider.overrideWithValue(cache)],
  );

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const seedColor = Color.fromARGB(255, 88, 0, 146);
    final colorScheme = ColorScheme.fromSeed(seedColor: seedColor).copyWith();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Labels.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: colorScheme.surfaceContainerLowest,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surfaceContainerLowest,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: seedColor,
            foregroundColor: Colors.white,
          ),
        ),
        colorScheme: colorScheme,
        cardTheme: CardTheme(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          margin: EdgeInsets.all(0),
          surfaceTintColor: Colors.white,
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // dynamicSchemeVariant: DynamicSchemeVariant.monochrome
      ),
      routerConfig: ref.read(routerProvider),
    );
  }
}
