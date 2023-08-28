import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/auth/view/interest_screen.dart';
import 'package:twitter/features/auth/view/widgets/auth_fill_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _passwordVisible = false;
  bool _passwordValidation = false;

  void _onMoveNextScreen() {
    print("object");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.blue,
            size: 40,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "You'll need a password",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Make sure it's 8 characters or more.",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    obscureText: _passwordVisible ? false : true,
                    onChanged: (value) {
                      if (value.length > 7) {
                        setState(() {
                          _passwordValidation = true;
                        });
                      } else {
                        setState(() {
                          _passwordValidation = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _passwordVisible = !_passwordVisible;
                              setState(() {});
                            },
                            icon: FaIcon(
                              _passwordVisible
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          if (_passwordValidation) ...[
                            const SizedBox(
                              width: 5,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                            ),
                          ],
                        ],
                      ),
                      hintText: "Password",
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: _passwordValidation ? _onMoveNextScreen : null,
                    child: AuthFillButton(
                      color: _passwordValidation
                          ? Colors.black
                          : Colors.grey.shade600,
                      text: "Next",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
