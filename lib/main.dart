import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';
import 'package:twitter/router.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode:
          ref.watch<ToggleDarkModeViewModel>(toggleDarkModeViewModel).isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
