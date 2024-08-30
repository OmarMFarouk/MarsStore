import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/hero_button.dart';

class ShoppingButton extends StatelessWidget {
  const ShoppingButton({
    super.key,
    required this.addToCar,
    required this.shoopingPrees,
  });
  final VoidCallback addToCar, shoopingPrees;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10.r),
          Container(
            height: SizeApp.buttonHeghtSize,
            width: SizeApp.buttonHeghtSize,
            decoration: BoxDecoration(
              color: ColorApp.backgroundColor,
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
              border: Border.all(color: ColorApp.primerColor, width: 2.w),
            ),
            child: IconButton(
              onPressed: addToCar,
              icon: SvgPicture.asset(
                iconApp.addToCarIcon,
                color: ColorApp.primerColor,
                width: 30.w,
              ),
            ),
          ),
          HeroButton(
            widthSize: SizeApp.screenWidth! * 0.70,
            onPressed: shoopingPrees,
            text: "but_now_msg",
            svgIcon: iconApp.getStartedIcon,
            isBorder: false,
            isIcon: true,
          ),
        ],
      ),
    );
  }
}
