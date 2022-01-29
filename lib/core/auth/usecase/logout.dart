import 'package:sticky_sessions/core/auth/data/auth_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';

class Logout extends UseCase<void, void> {
  AuthRepository repository = AuthRepositoryImpl();

  @override
  Future<void> execute([void param]) {
    return repository.logout();
  }
}
