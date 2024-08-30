import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/onbotding_functions.dart';
import 'package:mars/models/onbordind_model.dart';
import 'package:mars/package/indecator_babel_packge.dart';
import 'package:mars/widgets/hero_icon.dart';

class OnbordingNextButton extends StatelessWidget {
  const OnbordingNextButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      width: SizeApp.screenWidth! * 1,
      height: SizeApp.buttonHeghtSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20.w),
          ...List.generate(
            onbordindModel.onbordeingList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: IndecatorBabelPackge(
                isActive: index == onbotdingFunctions.indecatorIndex,
              ),
            ),
          ),
          const Spacer(),
          HeroIcon(
            onPressed: onPressed,
            svgIcon: iconApp.angleRightIcon,
          ),
        ],
      ),
    );
  }
}
