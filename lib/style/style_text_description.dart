import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';

TextStyle styleTextDescription() {
  return TextStyle(
    fontSize: SizeApp.smallTextSize,
    fontFamily: fontApp.mediumText,
    fontWeight: FontWeight.w300,
    color: ColorApp.descriptionColor,
  );
}
