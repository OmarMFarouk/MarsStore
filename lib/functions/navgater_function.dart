import 'package:flutter/material.dart';
import 'package:mars/src/app_shared.dart';

navgaterFunction(context, screen) {
  AppShared.localStorage.setBool('onboarded', true);
  return Navigator.push(
    context,
    PageRouteBuilder<Offset>(
      pageBuilder: (context, animation, secondaryAnimation) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin * 2, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: screen);
      },
    ),
  );
}
