import 'package:flutter/material.dart';
import 'package:twitter/features/profile/widgets/custom_appbar.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: "Privacy"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
