import 'package:sticky_sessions/core/utils/data_source.dart';

abstract class AuthRepository {
  Future<bool> isLogged();
  Future<void> logout();
}

class AuthRepositoryImpl extends AuthRepository {
  final DataSource _dataSource = DataSource();

  @override
  Future<bool> isLogged() async {
    final token = await _dataSource.get("token");
    final username = await _dataSource.get("username");

    if (token != null && username != null) {
      return true;
    }

    return false;
  }

  @override
  Future<void> logout() async {
    await _dataSource.delete("token");
    await _dataSource.delete("username");
  }
}
