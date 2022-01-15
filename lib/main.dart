import 'package:flutter/material.dart';
import 'package:sticky_sessions/features/home/home_screen.dart';
import 'package:sticky_sessions/features/login/login_screen.dart';
import 'package:sticky_sessions/features/login/login_token_screen.dart';
import 'package:sticky_sessions/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/login/token': (context) => const LoginTokenScreen(),
        '/home': (context) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
