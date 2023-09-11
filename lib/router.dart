import 'package:go_router/go_router.dart';
import 'package:twitter/features/activity/activity_screen.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';
import 'package:twitter/features/home/home_screen.dart';
import 'package:twitter/features/profile/privacy_screen.dart';
import 'package:twitter/features/profile/profile_screen.dart';
import 'package:twitter/features/profile/settings_screen.dart';
import 'package:twitter/features/search/search_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const MainNavigationScreen(screen: "home");
      },
      routes: [
        GoRoute(
          path: ":tab(search|activity|profile)",
          builder: (context, state) {
            final screen = state.pathParameters["tab"];
            print(screen);
            return MainNavigationScreen(screen: screen!);
          },
        ),
      ],
    ),

    // GoRoute(
    //   name: HomeScreen.routeName,
    //   path: HomeScreen.routeUrl,
    //   builder: (context, state) => const HomeScreen(),
    // ),
    // GoRoute(
    //   name: SearchScreen.routeName,
    //   path: SearchScreen.routeUrl,
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   name: ActivityScreen.routeName,
    //   path: ActivityScreen.routeUrl,
    //   builder: (context, state) => const ActivityScreen(),
    // ),
    // GoRoute(
    //   name: ProfileScreen.routeName,
    //   path: ProfileScreen.routeUrl,
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   name: SettingsScreen.routeName,
    //   path: SettingsScreen.routeUrl,
    //   builder: (context, state) => const SettingsScreen(),
    //   routes: const [
    //     // GoRoute(
    //     //   path: "/privacy",
    //     //   builder: (context, state) => const PrivacyScreen(),
    //     // ),
    //   ],
    // ),
  ],
);
