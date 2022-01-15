import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Column(children: const [
          Image(
            image: AssetImage('assets/app-icon.png'),
            width: 130,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sticky Session",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white, decoration: TextDecoration.none),
          )
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), onSurface: Colors.white),
            child: const Text("Log in with Google"),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, routerLoginToken);
            },
            style: TextButton.styleFrom(primary: Colors.white, padding: const EdgeInsets.all(16)),
            child: const Text("Log in with the token"),
          ),
        ])
      ]),
    );
  }
}
