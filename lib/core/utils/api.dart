import 'package:http/http.dart' as http;
import 'package:sticky_sessions/utils/constants.dart';

class API {
  Future<String?> get(String url) async {
    var response = await http.get(Uri.parse(baseUri + url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
