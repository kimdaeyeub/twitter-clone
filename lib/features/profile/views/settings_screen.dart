import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';
import 'package:twitter/features/profile/views/privacy_screen.dart';
import 'package:twitter/features/profile/views/widgets/custom_appbar.dart';
import 'package:twitter/features/profile/views/widgets/privacy_list_tile.dart';
import 'package:twitter/features/profile/views/widgets/settings_screen_list_tile.dart';
import 'package:twitter/utils.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = "settings";
  static const String routeUrl = "/settings";

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('로그아웃'),
        content: const Text('로그아웃 하시겠습니까?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context, ref);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: "Settings",
              isDark: isDark,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsScreenListTile(
              icon: FontAwesomeIcons.userPlus,
              text: "Follow and invite friends",
              isDark: isDark,
            ),
            SettingsScreenListTile(
              icon: FontAwesomeIcons.bell,
              text: "Notifications",
              isDark: isDark,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PrivacyScreen(),
                ),
              ),
              child: SettingsScreenListTile(
                icon: FontAwesomeIcons.lock,
                text: "Privacy",
                isDark: isDark,
              ),
            ),
            SettingsScreenListTile(
              icon: FontAwesomeIcons.circleUser,
              text: "Account",
              isDark: isDark,
            ),
            SettingsScreenListTile(
              icon: FontAwesomeIcons.lifeRing,
              text: "Help",
              isDark: isDark,
            ),
            SettingsScreenListTile(
              icon: FontAwesomeIcons.circleInfo,
              text: "About",
              isDark: isDark,
            ),
            PrivacyListTile(
              title: "다크모드",
              icon: ref
                      .watch<ToggleDarkModeViewModel>(toggleDarkModeViewModel)
                      .isDarkMode
                  ? FontAwesomeIcons.sun
                  : FontAwesomeIcons.moon,
              trailingWidget: CupertinoSwitch(
                value: ref
                    .watch<ToggleDarkModeViewModel>(toggleDarkModeViewModel)
                    .isDarkMode,
                onChanged: (value) => ref
                    .read<ToggleDarkModeViewModel>(toggleDarkModeViewModel)
                    .toggleDarkMode(),
              ),
              isDark: isDark,
            ),
            const Divider(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showAlertDialog(context),
                    child: FaIcon(
                      FontAwesomeIcons.rightFromBracket,
                      color: isDark ? Colors.grey.shade400 : null,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
