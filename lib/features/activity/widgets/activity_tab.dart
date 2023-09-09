import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isDark;
  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? isDark
                ? Colors.grey.shade900
                : Colors.black
            : null,
        border: isSelected ? null : Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected
              ? Colors.white
              : isDark
                  ? Colors.grey.shade400
                  : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
