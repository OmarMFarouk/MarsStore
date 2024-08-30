import 'package:flutter/material.dart';
import 'package:mars/theme/theme_dark_color.dart';
import 'package:mars/theme/theme_light_color.dart';

class ColorApp {
  static bool moodApp = true;

  static Color backgroundColor = moodApp
      ? ThemeLightColor.backgroundLightColor
      : ThemeDarkColor.backgroundDarkColor;

  static Color primerColor = moodApp
      ? ThemeLightColor.primerLightColor
      : ThemeDarkColor.primerDarkColor;

  static Color auxiliaryColor = moodApp
      ? ThemeLightColor.auxiliaryLightColor
      : ThemeDarkColor.auxiliaryDarkColor;

  static Color supColor =
      moodApp ? ThemeLightColor.supLightColor : ThemeDarkColor.supDarkColor;

  static Color iconColor =
      moodApp ? ThemeLightColor.iconLightColor : ThemeDarkColor.iconDarkColor;

  static Color titelColor =
      moodApp ? ThemeLightColor.titelLightColor : ThemeDarkColor.titelDarkColor;

  static Color textColor =
      moodApp ? ThemeLightColor.textLightColor : ThemeDarkColor.textDarkColor;

  static Color descriptionColor = moodApp
      ? ThemeLightColor.descriptionLightColor
      : ThemeDarkColor.descriptionDarkColor;

  static Color hintColor =
      moodApp ? ThemeLightColor.hintLightColor : ThemeDarkColor.hintDarkColor;

  static Color shadowColor = moodApp
      ? ThemeLightColor.shadowLightColor
      : ThemeDarkColor.shadowDarkColor;

  static Color erorrColor = const Color(0xFFF44336);
}
