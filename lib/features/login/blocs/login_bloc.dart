import 'dart:async';

import 'package:sticky_sessions/core/utils/bloc.dart';
import 'package:sticky_sessions/features/login/usecase/do_login.dart';
import 'package:sticky_sessions/features/login/model/login_model.dart';

class LoginBloc extends Bloc<LoginModel> {
  LoginBloc() : super(model: LoginModel());

  Future<void> logInWithToken({required String token, required String username}) async {
    model.isLoading = true;
    emit();

    bool result = await DoLogin().execute(DoLoginParams(token, username));

    model.isLoading = false;
    model.isLogged = result;

    emit();
  }
}
