import 'package:sticky_sessions/models/session.dart';
import 'package:sticky_sessions/models/user.dart';

class Meeting {
  String name;
  List<Session> sessions;
  List<User> users;
  String dateStart;
  String dateEnd;
  String place;

  Meeting({required this.name, required this.sessions, required this.users, required this.dateStart, required this.dateEnd, required this.place});
}
