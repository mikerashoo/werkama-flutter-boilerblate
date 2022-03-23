import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  num userCount = 100;

  void setUserCount(int _count) {
    userCount = _count;
    notifyListeners();
  }
}
