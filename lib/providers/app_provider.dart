import 'package:flutter/cupertino.dart';
import 'package:werkama_flutter_setup/apis/app_api.dart';
import 'package:werkama_flutter_setup/models/users_response.dart';

class AppProvider extends ChangeNotifier {
  num userCount = 0;

  void setUserCount(int _count) {
    userCount = _count;
    notifyListeners();
  }

  //call users api
  //if response is valid set usercount to fetched users count
  //return api response even if it is not valid
  Future<dynamic> fetchUsers() async {
    dynamic usersResponse = await AppApi().fetchUsers();
    if (usersResponse is UsersResponseData) {
      setUserCount(usersResponse.total!);
    }
    return usersResponse;
  }
}
