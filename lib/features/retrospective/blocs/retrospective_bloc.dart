import 'dart:async';

import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/features/retrospective/model/retrospective_model.dart';
import 'package:sticky_sessions/features/retrospective/usecase/on_init.dart';
import 'package:sticky_sessions/models/session.dart';

class RetrospectiveBloc extends Bloc<RetrospectiveModel> {
  RetrospectiveBloc() : super(model: RetrospectiveModel());

  Future<void> onInit(String meetingId) async {
    model.isLoading = true;
    emit();

    List<Session>? sessions = await OnInit().execute(meetingId);

    model.isLoading = false;
    model.sessions = sessions ?? [];

    emit();
  }
}
