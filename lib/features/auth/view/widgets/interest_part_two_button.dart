import 'package:flutter/material.dart';

class InterestPartTwoButton extends StatefulWidget {
  const InterestPartTwoButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestPartTwoButton> createState() => _InterestPartTwoButtonState();
}

class _InterestPartTwoButtonState extends State<InterestPartTwoButton> {
  bool _isTap = false;

  void _onTap() {
    _isTap = !_isTap;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(40),
            color: _isTap ? Colors.blue : null),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: _isTap ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
