import 'package:go_router/go_router.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';
import 'package:twitter/features/profile/privacy_screen.dart';
import 'package:twitter/features/profile/settings_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainNavigationScreen(screen: "home"),
    ),
    GoRoute(
      path: "/:screen(search|activity|profile)",
      builder: (context, state) {
        final screen = state.pathParameters["screen"];
        return MainNavigationScreen(screen: screen!);
      },
    ),
    GoRoute(
      name: SettingsScreen.routeName,
      path: SettingsScreen.routeUrl,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: "privacy",
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    )
  ],
);
