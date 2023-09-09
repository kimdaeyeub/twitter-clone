import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/profile/widgets/custom_appbar.dart';
import 'package:twitter/features/profile/widgets/privacy_list_tile.dart';
import 'package:twitter/utils.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivate = true;
  void _onChanged() {
    _isPrivate = !_isPrivate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: "Privacy",
              isDark: isDark,
            ),
            const SizedBox(
              height: 10,
            ),
            PrivacyListTile(
              trailingWidget: CupertinoSwitch(
                trackColor: Colors.black,
                value: _isPrivate,
                onChanged: (value) => _onChanged(),
              ),
              title: "Private profile",
              icon: FontAwesomeIcons.lock,
              isDark: isDark,
            ),
            PrivacyListTile(
              trailingWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Everyone",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: isDark ? Colors.white : Colors.grey.shade500,
                    size: 18,
                  )
                ],
              ),
              title: "Mentions",
              icon: FontAwesomeIcons.at,
              isDark: isDark,
            ),
            PrivacyListTile(
              title: "Muted",
              icon: FontAwesomeIcons.bellSlash,
              trailingWidget: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey.shade500,
                size: 18,
              ),
              isDark: isDark,
            ),
            PrivacyListTile(
              title: "Hidden Words",
              icon: FontAwesomeIcons.eyeSlash,
              trailingWidget: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey.shade500,
                size: 18,
              ),
              isDark: isDark,
            ),
            PrivacyListTile(
              title: "Profiles you follow",
              icon: FontAwesomeIcons.userGroup,
              trailingWidget: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey.shade500,
                size: 18,
              ),
              isDark: isDark,
            ),
            const Divider(
              height: 20,
            ),
            ListTile(
              title: const Text(
                "Other privacy settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade500,
                size: 18,
              ),
            ),
            PrivacyListTile(
              title: "Blocked profiles",
              icon: FontAwesomeIcons.circleXmark,
              trailingWidget: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade500,
                size: 18,
              ),
              isDark: isDark,
            ),
            PrivacyListTile(
              title: "Hide likes",
              icon: FontAwesomeIcons.heartCrack,
              trailingWidget: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade500,
                size: 18,
              ),
              isDark: isDark,
            )
          ],
        ),
      ),
    );
  }
}
