import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

class AboutScreenProvider extends ChangeNotifier {
  String _currentStatusOption = 'Available';
  String get currentStatusOption => _currentStatusOption;
  bool _loading = false;
  bool get loading => _loading;

  void fakeDelay(selectedStatus) {
    _loading = true;
    log(_currentStatusOption.toString());
    notifyListeners();
    Timer(const Duration(seconds: 2), () {
      _loading = false;
      changeStatus(selectedStatus);
      log(_currentStatusOption.toString());
      notifyListeners();
    });
  }

  void changeStatus(String selectedStatus) {
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
