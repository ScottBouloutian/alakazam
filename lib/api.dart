import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static final String apiRoot = 'https://ve2fkr5fc1.execute-api.us-east-1.amazonaws.com/dev/api';

  static Future<Map> getSoundSync() async {
    final response = await http.get('$apiRoot/sound-sync');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get sound-sync data');
    }
  }
}
