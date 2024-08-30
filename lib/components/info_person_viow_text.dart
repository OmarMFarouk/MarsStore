import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';

class InfoPersonViowText extends StatelessWidget {
  const InfoPersonViowText({
    super.key,
    required this.icon,
    required this.titel,
    required this.supTitel,
    this.trailing,
  });
  final String icon, titel, supTitel;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 25.w,
        color: ColorApp.textColor,
      ),
      title: Text(
        titel.tr(context),
        style: TextStyle(
          color: ColorApp.titelColor,
          // fontSize: SizeApp.smallTextSize,
          fontFamily: fontApp.mediumText,
          fontWeight: FontWeight.w300,
        ),
      ),
      subtitle: Text(
        supTitel,
        style: TextStyle(
          color: ColorApp.textColor,
          fontSize: SizeApp.smallTextSize,
          fontFamily: fontApp.bigText,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: trailing,
    );
  }
}
