import 'dart:async';

import 'package:sticky_sessions/core/auth/model/auth_model.dart';
import 'package:sticky_sessions/core/auth/usecase/is_logged.dart';
import 'package:sticky_sessions/core/auth/usecase/logout.dart';
import 'package:sticky_sessions/core/utils/bloc.dart';

class AuthBloc extends Bloc<AuthModel?> {
  AuthBloc() : super(model: null);

  Future<void> initializeAuth() async {
    bool result = await IsLogged().execute();

    model = AuthModel(isLogged: result);

    emit();
  }

  Future<void> logout() async {
    await Logout().execute();

    model?.isLogged = false;

    emit();
  }
}
