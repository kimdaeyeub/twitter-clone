import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/auth/view/email_verify_screen.dart';
import 'package:twitter/features/auth/view/widgets/auth_fill_button.dart';

class CustomizeScreen extends StatefulWidget {
  final String text;
  const CustomizeScreen({
    super.key,
    required this.text,
  });

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool _switchValue = false;

  void _signUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailVerifyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop("hello");
          },
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
          size: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Customize your experience",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Track where you see Twitter content across the web",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 280,
                      child: Text(
                        "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) {
                        _switchValue = !_switchValue;
                        setState(() {});
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "By signing up, you agree to our ",
                          ),
                          Text(
                            "Terms, Privacy",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Policy,",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "and",
                          ),
                          Text(
                            "Cookie Use.",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "Twitter may use your",
                          ),
                        ],
                      ),
                      Text(
                        "contact information, including your email address",
                      ),
                      Text(
                        "and phone number for purposes outlined in our",
                      ),
                      Row(
                        children: [
                          Text(
                            "Privacy Policy.",
                          ),
                          Text(
                            "Learn more",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: _switchValue ? _signUp : null,
              child: AuthFillButton(
                color: _switchValue ? Colors.black : Colors.grey.shade600,
                text: "Next",
              ),
            )
          ],
        ),
      ),
    );
  }
}
