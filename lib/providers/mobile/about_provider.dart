import 'dart:async';

import 'package:flutter/cupertino.dart';

class AboutScreenProvider extends ChangeNotifier {
  String _currentStatusOption = 'Available';
  String get currentStatusOption => _currentStatusOption;
  // Initial value is -1, which states there is no loading indication
  int _loading = -1;
  int get loading => _loading;
  // void toggleSelectorIcon(int i) {
  //   selectorIcon = true;
  // }

  void fakeDelay(selectedStatus, int i) {
    _loading = i;
    notifyListeners();
    Timer(const Duration(seconds: 2), () => changeStatus(selectedStatus));
  }

  void changeStatus(String selectedStatus) {
    _loading = -1;
    _currentStatusOption = selectedStatus;
    notifyListeners();
  }

  List<String> statusOptions = [
    'Available',
    'Busy',
    'At school',
    'At the movies',
    'Battery about to die',
    'Can\'t talk, WhatsApp only',
    'In a meeting',
    'At the gym',
    'Sleeping',
    'Urgent calls only'
  ];
}
