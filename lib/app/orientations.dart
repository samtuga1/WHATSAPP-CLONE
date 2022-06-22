import 'package:flutter/cupertino.dart';

enum DeviceType {
  mobile,
  windows,
}

class Orientations {
  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
