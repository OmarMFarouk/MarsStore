import 'package:flutter/material.dart';

class IntroFunctions {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 1.0,
  );
  bool isIntro = false;
  void goToLogin() {
    controller.animateToPage(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  void goToRegister() {
    controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}

IntroFunctions introFunctions = IntroFunctions();
