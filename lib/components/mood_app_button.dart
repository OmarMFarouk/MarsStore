import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/widgets/hero_animated_widget.dart';
import 'package:mars/widgets/text_localization.dart';

class MoodAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MoodAppButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: HeroAnimatedWidget(
          crossFadeState: ColorApp.moodApp,
          secondChild: ListTile(
            leading: SvgPicture.asset(
              iconApp.sunIcon,
              width: 30,
            ),
            title: TextLocalization(
              text: "light_mood_msg",
              style: TextStyle(
                fontSize: SizeApp.smallTextSize,
                fontFamily: fontApp.bigText,
                fontWeight: FontWeight.w300,
                color: ColorApp.descriptionColor,
              ),
            ),
          ),
          firstChild: ListTile(
            leading: SvgPicture.asset(
              iconApp.moonIcon,
              width: 30,
            ),
            title: TextLocalization(
              text: "dark_mood_msg",
              style: TextStyle(
                fontSize: SizeApp.smallTextSize,
                fontFamily: fontApp.bigText,
                fontWeight: FontWeight.w300,
                color: ColorApp.descriptionColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


