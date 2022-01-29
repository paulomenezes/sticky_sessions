import 'dart:convert';

import 'package:sticky_sessions/core/utils/api.dart';
import 'package:sticky_sessions/models/sticky.dart';

abstract class SessionRepository {
  Future<List<Sticky>?> onInit(String meetingId, String sessionId);
}

class SessionRepositoryImpl extends SessionRepository {
  final API _api = API();

  @override
  Future<List<Sticky>?> onInit(String meetingId, String sessionId) async {
    String? response = await _api.get('/sticky?meetingId=$meetingId&sessionId=$sessionId');

    if (response != null) {
      return (jsonDecode(response) as List).map((x) => Sticky.fromJson(x)).toList();
    }

    return null;
  }
}
