import 'dart:convert';

import 'package:sticky_sessions/core/utils/api.dart';
import 'package:sticky_sessions/models/meeting.dart';

abstract class HomeRepository {
  Future<List<Meeting>?> onInit();
}

class HomeRepositoryImpl extends HomeRepository {
  final API _api = API();

  @override
  Future<List<Meeting>?> onInit() async {
    String? response = await _api.get('/meeting');

    if (response != null) {
      return (jsonDecode(response) as List).map((x) => Meeting.fromJson(x)).toList();
    }

    return null;
  }
}
