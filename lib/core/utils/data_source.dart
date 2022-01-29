import 'package:shared_preferences/shared_preferences.dart';

class DataSource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> get(String key) async {
    return _prefs.then((prefs) {
      var value = prefs.getString(key);

      return value;
    }).catchError((error) {
      return null;
    });
  }

  Future<bool> set(String key, String value) async {
    return _prefs.then((prefs) {
      prefs.setString(key, value);

      return true;
    }).catchError((error) {
      return false;
    });
  }

  Future<bool> delete(String key) async {
    return _prefs.then((prefs) {
      prefs.remove(key);

      return true;
    }).catchError((error) {
      return false;
    });
  }
}
