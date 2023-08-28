import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/auth/view/create_account_screen.dart';
import 'package:twitter/features/auth/view/widgets/auth_button.dart';
import 'package:twitter/features/auth/view/widgets/auth_fill_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _onMoveCreateAccount(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 40,
            ),
            const SizedBox(
              height: 130,
            ),
            const Text(
              "See what's happening in the world right now.",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 150,
            ),
            const AuthButton(
              icon: FontAwesomeIcons.google,
              text: "Continue with Google",
            ),
            const SizedBox(
              height: 15,
            ),
            const AuthButton(
              icon: FontAwesomeIcons.apple,
              text: "Continue with Apple",
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 50,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "or",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _onMoveCreateAccount(context),
              child: const AuthFillButton(
                color: Colors.black,
                text: "Create account",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade800,
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "By signing up, you agree to our ",
                      ),
                      Text(
                        "Terms,",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Privacy Policy, ",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "and ",
                      ),
                      Text(
                        "Cookie Use.",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Have an account already? ",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 17,
                  ),
                ),
                const Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
