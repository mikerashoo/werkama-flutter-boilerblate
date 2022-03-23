import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:werkama_flutter_setup/models/users_response.dart';
import 'package:werkama_flutter_setup/utils/constants.dart';

class AppApi {
  Future<dynamic> fetchUsers() async {
    try {
      String fetchUserApi = '${BASE_API_URL}users';
      dynamic response = await http.get(Uri.parse(fetchUserApi));
      return UsersResponseData.fromJson(jsonDecode(response.body));
    } catch (e) {
      return e;
    }
  }
}
