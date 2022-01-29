import 'package:flutter/material.dart';
import 'package:sticky_sessions/core/auth/blocs/auth_bloc.dart';
import 'package:sticky_sessions/features/home/home_screen.dart';
import 'package:sticky_sessions/features/login/login_screen.dart';
import 'package:sticky_sessions/features/login/login_token_screen.dart';
import 'package:sticky_sessions/features/notification/notification_screen.dart';
import 'package:sticky_sessions/features/retrospective/retrospective_screen.dart';
import 'package:sticky_sessions/features/session/session_add_note.dart';
import 'package:sticky_sessions/features/session/session_add_screen.dart';
import 'package:sticky_sessions/features/session/session_screen.dart';
import 'package:sticky_sessions/features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc = AuthBloc();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Sessions',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/': (context) => SplashScreen(
              authBloc: authBloc,
            ),
        '/login': (context) => const LoginScreen(),
        '/login/token': (context) => const LoginTokenScreen(),
        '/home': (context) => HomeScreen(
              authBloc: authBloc,
            ),
        '/notification': (context) => const NotificationScreen(),
        '/retrospective': (context) => const RetrospectiveScreen(),
        '/session': (context) => const SessionScreen(),
        '/session/add': (context) => const SessionAddScreen(),
        '/session/add-note': (context) => const SessionAddNoteScreen(),
      },
      initialRoute: '/',
    );
  }
}
