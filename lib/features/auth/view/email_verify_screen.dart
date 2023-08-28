import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/auth/view/password_screen.dart';
import 'package:twitter/features/auth/view/widgets/auth_fill_button.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  bool _first = false;
  bool _second = false;
  bool _third = false;
  bool _fourth = false;

  void _moveNextScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          // foregroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 27,
            ),
          ),
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
                    height: 30,
                  ),
                  const Text(
                    "We sent you a code",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 200,
                    child: Text(
                      "Enter it below to verify jhon.mobbin@gmail.com.",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        return null;
                                      }
                                      return "";
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        FocusScope.of(context).nextFocus();
                                        _first = true;
                                      } else {
                                        _first = false;
                                      }
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        return null;
                                      }
                                      return "";
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        FocusScope.of(context).nextFocus();
                                        _second = true;
                                      } else {
                                        _second = false;
                                      }
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        return null;
                                      }
                                      return "";
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        FocusScope.of(context).nextFocus();
                                        _third = true;
                                      } else {
                                        _third = false;
                                      }
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        return null;
                                      }
                                      return "";
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        // FocusScope.of(context).nextFocus();
                                        _fourth = true;
                                      } else {
                                        _fourth = false;
                                      }
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          if (_first && _second && _third && _fourth)
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: 30,
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Didn't receive email?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: _first && _second && _third && _fourth
                        ? _moveNextScreen
                        : null,
                    child: AuthFillButton(
                      color: _first && _second && _third && _fourth
                          ? Colors.black
                          : Colors.grey.shade700,
                      text: "Next",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
