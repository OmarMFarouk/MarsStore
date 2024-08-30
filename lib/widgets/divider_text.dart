import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/widgets/text_localization.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Row(
        children: [
          Expanded(child: Divider(color: ColorApp.descriptionColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextLocalization(
              text: text,
              style: styleTextDescription(),
            ),
          ),
          Expanded(child: Divider(color: ColorApp.descriptionColor)),
        ],
      ),
    );
  }
}
