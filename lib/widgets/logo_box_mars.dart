import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/text_normal.dart';

class LogoBoxMars extends StatelessWidget {
  const LogoBoxMars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconApp.marsLogo,
            width: 60.w,
            color: ColorApp.moodApp ? null : const Color(0xFFF8A2AB),
          ),
          TextNormal(
            text: "mars".toUpperCase(),
            style: TextStyle(
              fontFamily: fontApp.heroText,
              fontSize: SizeApp.bigTextSize,
              color: ColorApp.primerColor,
            ),
          ),
        ],
      ),
    );
  }
}
