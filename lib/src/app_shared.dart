import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  static late SharedPreferences localStorage;
  static Future<void> init() async {
    localStorage = await SharedPreferences.getInstance();
  }
}
