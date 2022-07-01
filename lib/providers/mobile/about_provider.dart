import 'package:flutter/cupertino.dart';

class AboutScreenProvider extends ChangeNotifier {
  String _currentStatusOption = 'Available';
  String get currentStatusOption => _currentStatusOption;

  void changeStatus(String selectedStatus) {
    _currentStatusOption = selectedStatus;
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
    'Urgent calls only,'
  ];
}
