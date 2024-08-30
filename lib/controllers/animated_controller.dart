import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/intro_screen/intro_bloc.dart';
import 'package:mars/bloc/otp_screen/otp_bloc.dart';
import 'package:mars/functions/intro_functions.dart';
import 'package:mars/functions/otp_functions.dart';

Timer? animationTimer;

class AnimatedController {
  introAnimatedController(BuildContext context) {
    animationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      introFunctions.isIntro = true;
      context.read<IntroBloc>().add((IntroAnimatedEvent()));
    });
  }

  // otp screen animated controller
  otpAnimatedController(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      otpFunctions.showSend = true;
      context.read<OtpBloc>().add((OtpAnimatedEvent()));
    });
  }
}

AnimatedController animatedController = AnimatedController();
