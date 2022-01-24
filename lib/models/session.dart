import 'package:flutter/material.dart';
import 'package:sticky_sessions/models/session_technique.dart';
import 'package:sticky_sessions/models/sticky.dart';

class Session {
  String title;
  String description;
  Color color;
  List<Sticky> stickies;
  SessionTechnique sessionTechnique;

  Session({required this.title, required this.description, required this.color, required this.stickies, required this.sessionTechnique});
}
