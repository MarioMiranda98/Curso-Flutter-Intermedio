import 'package:flutter/services.dart';

class Helpers {
  static void changeStatusBarLight() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static void changeStatusBarDark() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
