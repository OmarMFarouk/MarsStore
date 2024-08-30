import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';

class StyleBoxShadow {
  BoxShadow primerBoxShadow = BoxShadow(
    color: ColorApp.primerColor.withOpacity(0.7),
    offset: const Offset(0, 5),
    blurRadius: 8,
  );
  BoxShadow backBoxShadow = BoxShadow(
    color: ColorApp.moodApp
        ? Colors.black.withOpacity(0.2)
        : Colors.white.withOpacity(0.2),
    offset: const Offset(0, 4),
    blurRadius: 8,
  );
}

StyleBoxShadow styleBoxShadow = StyleBoxShadow();
