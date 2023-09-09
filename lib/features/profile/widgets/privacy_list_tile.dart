import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailingWidget;
  final bool isDark;

  const PrivacyListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.trailingWidget,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: isDark ? Colors.grey.shade400 : Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailingWidget,
    );
  }
}
