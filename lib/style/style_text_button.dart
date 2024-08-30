import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';

TextStyle styleTextButton() {
  return TextStyle(
    fontSize: SizeApp.mediumTextSize,
    fontFamily: fontApp.mediumText,
    fontWeight: FontWeight.bold,
    color: ColorApp.titelColor,
  );
}
