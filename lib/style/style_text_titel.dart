import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';

TextStyle styleTextTitel() {
  return TextStyle(
    fontSize: SizeApp.bigTextSize,
    fontFamily: fontApp.bigText,
    fontWeight: FontWeight.w700,
    color: ColorApp.titelColor,
  );
}
