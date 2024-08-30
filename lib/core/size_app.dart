import 'package:flutter/widgets.dart';

class SizeApp {
  static double? screenWidth;
  static double? screenHeight;
  static double? smallTextSize;
  static double? bigTextSize;
  static double? mediumTextSize;
  static double? buttonHeghtSize;
  static double? radiusSize;

  /// [screenWidth] Save the screen width value
  /// [screenHeight] Save the screen height value
  /// [smallTextSize] Save The all text,subTitel and description size
  /// [bigTextSize] Save The titel size

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    smallTextSize = MediaQuery.of(context).size.height <= 660 ? 16 : 18;
    mediumTextSize = MediaQuery.of(context).size.height <= 660 ? 17 : 19;
    bigTextSize = MediaQuery.of(context).size.height <= 660 ? 18 : 30;
    buttonHeghtSize = MediaQuery.of(context).size.height * 0.065;
    radiusSize = MediaQuery.of(context).size.height * 0.01;
  }
}
