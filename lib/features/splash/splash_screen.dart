import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed(routerLogin));

    return Container(
      color: backgroundColor,
      child: const Image(image: AssetImage('assets/app-icon.png')),
    );
  }
}
