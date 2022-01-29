import 'package:sticky_sessions/features/login/data/login_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';

class DoLogin extends UseCase<DoLoginParams, bool> {
  LoginRepository repository = LoginRepositoryImpl();

  @override
  Future<bool> execute(DoLoginParams param) {
    return repository.login(param.token, param.username);
  }
}

class DoLoginParams {
  final String token;
  final String username;

  DoLoginParams(this.token, this.username);
}
