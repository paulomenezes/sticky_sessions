import 'dart:async';

import 'package:sticky_sessions/core/database/database_service.dart';
import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/core/utils/network.dart';
import 'package:sticky_sessions/features/session/model/session_model.dart';
import 'package:sticky_sessions/features/session/usecase/on_init.dart';
import 'package:sticky_sessions/models/session.dart';
import 'package:sticky_sessions/models/sticky.dart';

class SessionBloc extends Bloc<SessionModel> {
  SessionBloc() : super(model: SessionModel());

  Future<void> onInit(Session session) async {
    model.isLoading = true;
    emit();

    List<Sticky>? stickies = [];

    if (await hasNetwork()) {
      stickies = await OnInit().execute([session.meetingId ?? "", session.id ?? ""]);
    } else {
      stickies = (await DatabaseService().list('stickies'))?.map((e) => Sticky.fromJson(e)).toList() ?? [];
    }

    model.isLoading = false;
    model.session = session;
    model.stickies = stickies ?? [];

    for (var sticky in model.stickies) {
      if (model.stickyByColumnMap.containsKey(sticky.columnName)) {
        model.stickyByColumnMap[sticky.columnName]!.add(sticky);
      } else {
        model.stickyByColumnMap[sticky.columnName ?? ""] = [sticky];
      }
    }

    for (var sticky in model.stickies) {
      DatabaseService().insert('stickies', sticky.toJson());
    }

    emit();
  }
}
