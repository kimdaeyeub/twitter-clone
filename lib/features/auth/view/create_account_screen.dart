import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:twitter/features/auth/view/customize_screen.dart';
import 'package:twitter/features/auth/view/email_verify_screen.dart';
import 'package:twitter/features/auth/view/widgets/auth_fill_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String _name = "";
  String _email = "";
  bool _pop = false;

  bool _nameIsEmpty = true;
  bool _emailIsEmpty = true;
  bool _helperTextVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      _name = _nameController.text;
      if (_nameController.text.isNotEmpty) {
        _nameIsEmpty = false;
      } else {
        _nameIsEmpty = true;
      }
      setState(() {});
    });
    _emailController.addListener(() {
      _email = _emailController.text;
      if (_emailController.text.isNotEmpty) {
        _emailIsEmpty = false;
      } else {
        _emailIsEmpty = true;
      }
      setState(() {});
    });
  }

  void _scaffoldTap() {
    _helperTextVisible = false;
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  void _onTapBirthdayField() {
    setState(() {
      _helperTextVisible = true;
    });
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        color: Colors.white,
        height: 200,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (value) {
            // _date = value.toString().substring(0, 10);
            _dateController.text = value.toString().substring(0, 10);
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _scaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.blue,
            size: 40,
          ),
          leading: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _nameController,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        suffix: _nameIsEmpty
                            ? null
                            : const FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.green,
                                size: 25,
                              ),
                        labelText: "Name",
                        floatingLabelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        suffix: _emailIsEmpty
                            ? null
                            : const FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.green,
                                size: 25,
                              ),
                        labelText: "Phone number or email address",
                        floatingLabelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onTap: _onTapBirthdayField,
                      keyboardType: TextInputType.none,
                      controller: _dateController,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        helperText: _helperTextVisible
                            ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                            : null,
                        helperMaxLines: 4,
                        helperStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        labelText: "Date of birth",
                        floatingLabelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (!_pop)
                  GestureDetector(
                    onTap: () async {
                      if (!_emailIsEmpty &&
                          !_nameIsEmpty &&
                          _dateController.text.isNotEmpty) {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const CustomizeScreen(text: "hello"),
                          ),
                        );
                        if (result != null) {
                          _pop = true;
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: !_emailIsEmpty &&
                                !_nameIsEmpty &&
                                _dateController.text.isNotEmpty
                            ? Colors.blue
                            : Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("By signing up, you agree to the"),
                                Text(
                                  "Terms of Service",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("and "),
                                Text(
                                  "Privacy Policy, ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                Text("including "),
                                Text(
                                  "Cookie Use. ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                Text("Twitter"),
                              ],
                            ),
                            Text(
                                "may use your contact information, including your"),
                            Text("email address and phone number for purposes"),
                            Text(
                                "outlined in our Privacy Policy, like keeping your"),
                            Text(
                                "account secure and personalizing our services,"),
                            Row(
                              children: [
                                Text("including ads. "),
                                Text(
                                  "Learn more. ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                Text("Others will be able to"),
                              ],
                            ),
                            Text(
                                "find you by email or phone number, when provided,"),
                            Row(
                              children: [
                                Text("unless you choose otherwise "),
                                Text(
                                  "here.",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EmailVerifyScreen(),
                          ),
                        ),
                        child: const AuthFillButton(
                          color: Colors.blue,
                          text: "Sign up",
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
