import 'package:sticky_sessions/core/auth/data/auth_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';

class IsLogged extends UseCase<void, bool> {
  AuthRepository repository = AuthRepositoryImpl();

  @override
  Future<bool> execute([void param]) {
    return repository.isLogged();
  }
}
