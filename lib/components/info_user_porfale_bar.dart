import 'package:flutter/material.dart';
import 'package:mars/components/info_detiails_icon.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/text_localization.dart';

class InfoUserProfleBar extends StatelessWidget {
  final String titelScreenMsg;
  InfoUserProfleBar({
    super.key,
    this.endIcon, required this.titelScreenMsg,
  });
  Widget? endIcon = Container();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth,
      child: Row(
        children: [
          DetlailsIcon(
            onPressed: () {
              Navigator.pop(context);
            },
            svgIcon: iconApp.angleLeftIcon,
          ),
          const Spacer(),
          TextLocalization(
            text: titelScreenMsg,
            style: TextStyle(
              fontSize: SizeApp.smallTextSize,
              fontFamily: fontApp.bigText,
              fontWeight: FontWeight.w300,
              color: ColorApp.titelColor,
            ),
          ),
          const Spacer(),
          endIcon!,
        ],
      ),
    );
  }
}
