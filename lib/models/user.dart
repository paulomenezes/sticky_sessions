import 'package:sticky_sessions/models/meeting.dart';

class User {
  String name;
  String username;
  String token;
  String? picture;
  List<Meeting> meetings;

  User({required this.name, required this.username, required this.token, this.picture, required this.meetings});
}
