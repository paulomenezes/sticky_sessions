import 'package:sticky_sessions/models/User.dart';

class Sticky {
  User user;
  String description;
  DateTime dateCreate;
  DateTime dateUpdate;
  String column;

  Sticky({required this.user, required this.description, required this.dateCreate, required this.dateUpdate, required this.column});
}
