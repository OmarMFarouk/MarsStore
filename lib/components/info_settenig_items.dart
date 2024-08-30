import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/text_localization.dart';

class InfoSettenigItems extends StatelessWidget {
  const InfoSettenigItems(
      {super.key,
      required this.onPressed,
      required this.titel,
      required this.icon});
  final VoidCallback onPressed;
  final String titel;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          leading: SvgPicture.asset(
            icon,
            width: 30,
          ),
          title: TextLocalization(
            text: titel,
            style: TextStyle(
              fontSize: SizeApp.smallTextSize,
              fontFamily: fontApp.bigText,
              fontWeight: FontWeight.w300,
              color: ColorApp.descriptionColor,
            ),
          ),
        ),
      ),
    );
  }
}
