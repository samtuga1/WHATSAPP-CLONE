import 'package:flutter/material.dart';

class CallScreenProvider extends ChangeNotifier {
  int _cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => _cupertinoTabBarValue;

  void changeCupertinoValue(int index) {
    _cupertinoTabBarValue = index;
    notifyListeners();
  }
}
