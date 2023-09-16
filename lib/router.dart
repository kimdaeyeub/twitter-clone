import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/auth/repos/auth_repo.dart';
import 'package:twitter/features/auth/view/login_screen.dart';
import 'package:twitter/features/auth/view/sign_in_screen.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';
import 'package:twitter/features/profile/views/privacy_screen.dart';
import 'package:twitter/features/profile/views/settings_screen.dart';

final router = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.matchedLocation != SignInScreen.routeURL &&
              state.matchedLocation != LoginScreen.routeURL) {
            return LoginScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: SignInScreen.routeURL,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeURL,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/",
          builder: (context, state) =>
              const MainNavigationScreen(screen: "home"),
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
  },
);
