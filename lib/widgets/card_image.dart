import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';

class CardWithImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  const CardWithImage({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        border: Border.all(color: ColorApp.primerColor),
        borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
        color: ColorApp.auxiliaryColor.withOpacity(0.2),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(imagePath, height: 40.h),
      ),
    );
  }
}
