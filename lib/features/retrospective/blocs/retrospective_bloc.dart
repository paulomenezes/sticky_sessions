import 'dart:async';

import 'package:sticky_sessions/core/database/database_service.dart';
import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/core/utils/network.dart';
import 'package:sticky_sessions/features/retrospective/model/retrospective_model.dart';
import 'package:sticky_sessions/features/retrospective/usecase/on_init.dart';
import 'package:sticky_sessions/models/session.dart';

class RetrospectiveBloc extends Bloc<RetrospectiveModel> {
  RetrospectiveBloc() : super(model: RetrospectiveModel());

  Future<void> onInit(String meetingId) async {
    model.isLoading = true;
    emit();

    List<Session>? sessions = [];

    if (await hasNetwork()) {
      sessions = await OnInit().execute(meetingId);
    } else {
      sessions = (await DatabaseService().list('sessions'))?.map((e) => Session.fromJson(e)).toList() ?? [];
    }

    model.isLoading = false;
    model.sessions = sessions ?? [];

    for (var session in model.sessions) {
      DatabaseService().insert('sessions', session.toJson());
    }

    emit();
  }
}
