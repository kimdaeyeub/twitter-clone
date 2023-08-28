import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  const InterestButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: widget.isSelected ? Colors.blue : null,
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: widget.isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
