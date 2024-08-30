import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/screens/person_Screen.dart';
import 'package:mars/theme/theme_dark_color.dart';
import 'package:mars/widgets/text_normal.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.titelScreen = "mars",
  });
  final String? titelScreen;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        padding: EdgeInsets.only(left: 15.w, right: 12.w),
        width: SizeApp.screenWidth,
        child: Row(
          children: [
            SvgPicture.asset(
              iconApp.marsLogo,
              width: 35.w,
              color: ColorApp.moodApp ? null : ThemeDarkColor.primerDarkColor,
            ),
            SizedBox(width: 10.w),
            TextNormal(
              text: titelScreen!.toUpperCase(),
              style: TextStyle(
                fontSize: SizeApp.bigTextSize,
                fontFamily: fontApp.bigText,
                fontWeight: FontWeight.w700,
                color: ColorApp.primerColor,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => navgaterFunction(context, const PersonScreen()),
              icon: CircleAvatar(
                foregroundColor: ColorApp.primerColor,
                backgroundColor: ColorApp.backgroundColor,
                backgroundImage: const AssetImage(
                  "assets/images/wallpaper-image.jpg",
                ),
                child: SvgPicture.asset(
                  iconApp.personIcon,
                  color: ColorApp.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
