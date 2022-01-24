import 'package:sticky_sessions/models/meeting.dart';

class User {
  String name;
  String picture;
  List<Meeting> meetings;

  User({required this.name, required this.picture, required this.meetings});
}
