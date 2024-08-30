import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/text_localization.dart';

class CustomTitelBar extends StatelessWidget {
  const CustomTitelBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth,
      child: TextLocalization(
        text: text,
        style: TextStyle(
          fontSize: SizeApp.smallTextSize,
          fontFamily: fontApp.bigText,
          fontWeight: FontWeight.w300,
          color: ColorApp.titelColor,
        ),
      ),
    );
  }
}
