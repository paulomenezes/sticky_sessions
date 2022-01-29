import 'package:sticky_sessions/models/session.dart';
import 'package:sticky_sessions/models/sticky.dart';

class SessionModel {
  bool isLoading = true;
  Session? session;
  List<Sticky> stickies = [];
  Map<String, List<Sticky>> stickyByColumnMap = {};
}
