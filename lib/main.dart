import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(),
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
          )),
    );
  }
}
