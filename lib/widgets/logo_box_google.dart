import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';

class GoogleLogoBox extends StatelessWidget {
  const GoogleLogoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageApp.googleLogo,
          width: 60.w,
        ),
        Text(
          "google_titel_msg".tr(context),
          style: TextStyle(
            fontFamily: fontApp.heroText,
            fontSize: 25.r,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
