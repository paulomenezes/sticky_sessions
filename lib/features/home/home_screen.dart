import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/main_drawer.dart';
import 'package:sticky_sessions/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var textControllerToken = TextEditingController();
  var textControllerUsername = TextEditingController();

  var isButtonEnabled = false;

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          shadowColor: Colors.grey.shade50,
          title: const Text(
            'Meetings',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const MainDrawer(),
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
