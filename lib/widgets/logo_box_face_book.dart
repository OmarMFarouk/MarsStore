import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';

class FacBookLogoBox extends StatelessWidget {
  const FacBookLogoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageApp.facebookLogo,
          width: 60.w,
        ),
        Text(
          "face_book_titel_msg".tr(context),
          style: TextStyle(
            fontFamily: fontApp.heroText,
            fontSize: 25.r,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
