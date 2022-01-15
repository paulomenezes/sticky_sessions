import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class LoginTokenScreen extends StatefulWidget {
  const LoginTokenScreen({Key? key}) : super(key: key);

  @override
  State<LoginTokenScreen> createState() => _LoginTokenScreenState();
}

class _LoginTokenScreenState extends State<LoginTokenScreen> {
  var textControllerToken = TextEditingController();
  var textControllerUsername = TextEditingController();

  var isButtonEnabled = false;
  var isLoading = false;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerToken.text.isNotEmpty && textControllerUsername.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerToken.addListener(() => updateButtonStatus());
    textControllerUsername.addListener(() => updateButtonStatus());
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: 50,
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              shadowColor: Colors.transparent,
              title: const Text(
                'Log In with the Token',
              ),
            ),
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const Text(
                  "If you do not have a token, ask for meeting admin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.none),
                ),
                const SizedBox(height: 40),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Token',
                  ),
                  controller: textControllerToken,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  controller: textControllerUsername,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          setState(() {
                            isLoading = true;

                            Timer(const Duration(seconds: 2),
                                () => Navigator.of(context).pushNamedAndRemoveUntil(routerHome, (Route<dynamic> route) => false));
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    onSurface: isButtonEnabled ? Colors.white : Colors.grey,
                  ),
                  child: const Text("Log In"),
                )
              ]),
            ));
  }
}
