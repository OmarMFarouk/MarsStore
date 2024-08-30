import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/models/navigator_bar_moodel.dart';

class InfoNavgitorBar extends StatelessWidget {
  const InfoNavgitorBar({
    super.key,
    required this.index,
    required this.currenIndex,
  });
  final int index, currenIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          height: index == currenIndex ? 6 : 0,
          width: 27.w,
          decoration: BoxDecoration(
            color: ColorApp.titelColor,
            borderRadius: BorderRadius.circular(
              SizeApp.radiusSize as double,
            ),
          ),
        ),
        SvgPicture.asset(
          navigatorBarModel.navigatorList[index].svgIcon,
          width: 27.w,
          color: index == blocNavigator.currenIndex
              ? ColorApp.titelColor
              : ColorApp.supColor,
        ),
      ],
    );
  }
}
