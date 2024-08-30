import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/text_localization.dart';

class HeroButton extends StatelessWidget {
  const HeroButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.svgIcon,
    required this.isBorder,
    required this.isIcon,
    required this.widthSize,
  });

  final VoidCallback onPressed;
  final String text, svgIcon;
  final bool isBorder, isIcon;
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      width: widthSize,
      height: SizeApp.buttonHeghtSize,
      decoration: BoxDecoration(
        color: isBorder ? Colors.transparent : ColorApp.primerColor,
        borderRadius: BorderRadius.circular(SizeApp.radiusSize!),
        border: Border.all(color: ColorApp.primerColor),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLocalization(
              text: text,
              style: TextStyle(
                color: ColorApp.backgroundColor,
                fontFamily: fontApp.bigText,
                fontSize: SizeApp.mediumTextSize! + 5,
              ),
            ),
            isIcon
                ? SvgPicture.asset(
                    svgIcon,
                    color: ColorApp.backgroundColor,
                    height: 20.h,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
