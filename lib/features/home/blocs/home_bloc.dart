import 'dart:async';

import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/features/home/model/home_model.dart';
import 'package:sticky_sessions/features/home/usecase/on_init.dart';
import 'package:sticky_sessions/models/meeting.dart';

class HomeBloc extends Bloc<HomeModel> {
  HomeBloc() : super(model: HomeModel());

  Future<void> onInit() async {
    model.isLoading = true;
    emit();

    List<Meeting>? meetings = await OnInit().execute();

    model.isLoading = false;
    model.meetings = meetings ?? [];

    emit();
  }
}
