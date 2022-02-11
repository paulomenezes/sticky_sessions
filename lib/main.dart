import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sticky_sessions/core/auth/blocs/auth_bloc.dart';
import 'package:sticky_sessions/core/database/database_service.dart';
import 'package:sticky_sessions/features/home/home_screen.dart';
import 'package:sticky_sessions/features/login/login_screen.dart';
import 'package:sticky_sessions/features/login/login_token_screen.dart';
import 'package:sticky_sessions/features/notification/notification_screen.dart';
import 'package:sticky_sessions/features/retrospective/retrospective_screen.dart';
import 'package:sticky_sessions/features/session/session_add_note.dart';
import 'package:sticky_sessions/features/session/session_add_screen.dart';
import 'package:sticky_sessions/features/session/session_screen.dart';
import 'package:sticky_sessions/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'sticky_database.db'),
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE meetings(id TEXT PRIMARY KEY, description TEXT, endDate TEXT, local TEXT, people INTEGER, sessions INTEGER, startDate TEXT, title TEXT)',
      );
      db.execute(
        'CREATE TABLE sessions(answer INTEGER, columns TEXT, description TEXT, highlight TEXT, id TEXT PRIMARY KEY, meetingId TEXT, name TEXT)',
      );
      db.execute(
        'CREATE TABLE stickies(columnName TEXT, content TEXT, id TEXT PRIMARY KEY, sessionId TEXT, userName TEXT)',
      );
      db.execute(
        'CREATE TABLE users(name TEXT)',
      );
    },
    version: 3,
  );

  DatabaseService().setDatabase(database);

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
