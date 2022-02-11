import 'dart:async';

import 'package:sticky_sessions/core/database/database_service.dart';
import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/core/utils/network.dart';
import 'package:sticky_sessions/features/home/model/home_model.dart';
import 'package:sticky_sessions/features/home/usecase/on_init.dart';
import 'package:sticky_sessions/models/meeting.dart';

class HomeBloc extends Bloc<HomeModel> {
  HomeBloc() : super(model: HomeModel());

  Future<void> onInit() async {
    model.isLoading = true;
    emit();

    List<Meeting>? meetings = [];

    if (await hasNetwork()) {
      meetings = await OnInit().execute();
    } else {
      meetings = (await DatabaseService().list('meetings'))?.map((e) => Meeting.fromJson(e)).toList() ?? [];
    }

    model.isLoading = false;
    model.meetings = meetings ?? [];

    for (var meeting in model.meetings) {
      DatabaseService().insert('meetings', meeting.toJson());
    }

    emit();
  }
}
