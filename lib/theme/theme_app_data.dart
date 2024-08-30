import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/theme/theme_dark_color.dart';
import 'package:mars/theme/theme_light_color.dart';

class ThemeAppData {
  ThemeData thmeAppData() {
    return ThemeData(
      brightness: ColorApp.moodApp ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor: ColorApp.backgroundColor,
      primaryColor: ColorApp.primerColor,
      primaryColorDark: ThemeDarkColor.primerDarkColor,
      primaryColorLight: ThemeLightColor.primerLightColor,
      hintColor: ColorApp.hintColor,
      splashColor: ColorApp.primerColor,
      dividerColor: ColorApp.titelColor,
      shadowColor: ColorApp.primerColor,
      cardColor: ColorApp.backgroundColor,
      indicatorColor: ColorApp.primerColor,
    );
  }
}

ThemeAppData themeAppData = ThemeAppData();
