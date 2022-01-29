import 'dart:convert';

import 'package:sticky_sessions/core/utils/api.dart';
import 'package:sticky_sessions/models/session.dart';

abstract class RetrospectiveRepository {
  Future<List<Session>?> onInit(String meetingId);
}

class RetrospectiveRepositoryImpl extends RetrospectiveRepository {
  final API _api = API();

  @override
  Future<List<Session>?> onInit(String meetingId) async {
    String? response = await _api.get('/session?meetingId=$meetingId');

    if (response != null) {
      return (jsonDecode(response) as List).map((x) => Session.fromJson(x)).toList();
    }

    return null;
  }
}
