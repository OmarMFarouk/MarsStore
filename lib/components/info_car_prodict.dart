import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_box_shadow.dart';

class InfoCarProdict extends StatelessWidget {
  const InfoCarProdict({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      width: SizeApp.screenWidth! * 1,
      decoration: BoxDecoration(
        color: ColorApp.backgroundColor,
        boxShadow: [styleBoxShadow.backBoxShadow],
        borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: ColorApp.backgroundColor,
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/wallpaper-image.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "data",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontApp.bigText,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.titelColor,
                ),
              ),
              Text(
                "data",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: fontApp.mediumText,
                  fontWeight: FontWeight.w300,
                  color: ColorApp.descriptionColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "data",
                  style: TextStyle(
                    fontSize: SizeApp.smallTextSize,
                    fontFamily: fontApp.mediumText,
                    fontWeight: FontWeight.w300,
                    color: ColorApp.textColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  iconApp.deleteIcon,
                  color: ColorApp.erorrColor,
                  width: 30.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
