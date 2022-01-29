import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_sessions/core/auth/blocs/auth_bloc.dart';
import 'package:sticky_sessions/core/auth/model/auth_model.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  final AuthBloc authBloc;

  const SplashScreen({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<AuthModel?>? subscription;

  @override
  void initState() {
    super.initState();

    widget.authBloc.initializeAuth();
    subscription = widget.authBloc.stream.listen((event) {
      Timer(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed(event?.isLogged == true ? routerHome : routerLogin));
    });
  }

  @override
  void dispose() {
    super.dispose();

    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: const Image(image: AssetImage('assets/app-icon.png')),
    );
  }
}
