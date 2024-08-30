import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/widgets/card_image.dart';

class InfoUserContinuo extends StatelessWidget {
  const InfoUserContinuo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // continue with google
        CardWithImage(
          onPressed: () {},
          imagePath: imageApp.googleLogo,
        ),
        SizedBox(width: 25.w),
        // continue with facebook
        CardWithImage(
          onPressed: () {},
          imagePath: imageApp.facebookLogo,
        ),
      ],
    );
  }
}
