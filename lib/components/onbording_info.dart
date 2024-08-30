import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_box_shadow.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_titel.dart';
import 'package:mars/widgets/text_localization.dart';

class OnbordingInfo extends StatelessWidget {
  const OnbordingInfo({
    super.key,
    required this.imageSrc,
    required this.titel,
    required this.description,
  });
  final String imageSrc, titel, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeApp.screenWidth! * 0.9,
          height: SizeApp.screenWidth! * 0.9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imageSrc),
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
            ),
            boxShadow: [styleBoxShadow.primerBoxShadow],
          ),
        ),
        SizedBox(
          height: SizeApp.screenHeight! * 0.07,
        ),
        TextLocalization(
          text: titel,
          style: styleTextTitel(),
        ),
        SizedBox(
          height: SizeApp.screenHeight! * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: TextLocalization(
            text: description,
            style: styleTextDescription(),
          ),
        ),
      ],
    );
  }
}
