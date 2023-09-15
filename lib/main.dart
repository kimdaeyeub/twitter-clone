import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';
import 'package:twitter/router.dart';
import 'package:twitter/utils.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ToggleDarkModeViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ToggleDarkModeViewModel>().isDarkMode
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
