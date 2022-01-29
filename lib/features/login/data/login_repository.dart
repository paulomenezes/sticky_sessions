import 'package:sticky_sessions/core/utils/api.dart';
import 'package:sticky_sessions/core/utils/data_source.dart';

abstract class LoginRepository {
  Future<bool> login(String token, String username);
}

class LoginRepositoryImpl extends LoginRepository {
  final DataSource _dataSource = DataSource();
  final API _api = API();

  @override
  Future<bool> login(String token, String username) async {
    return Future.delayed(const Duration(seconds: 5), () async {
      await _dataSource.set("token", token);
      await _dataSource.set("username", username);

      String? response = await _api.get('/');

      if (response != null) {
        await _dataSource.set("meetings", response);

        return true;
      }

      return false;
    });
  }
}
