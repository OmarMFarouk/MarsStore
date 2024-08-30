import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/show_passwerd/show_passwerd_bloc.dart';
import 'package:mars/components/intro_info.dart';
import 'package:mars/controllers/animated_controller.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/functions/intro_functions.dart';
import 'package:mars/screens/auth/login_screen.dart';
import 'package:mars/screens/auth/register_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    animatedController.introAnimatedController(context);
    return BlocProvider(
      create: (context) => ShowPasswerdBloc(),
      child: Scaffold(
        backgroundColor: ColorApp.backgroundColor,
        body: PageView(
          controller: introFunctions.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            LoginScreen(),
            IntroInfo(),
            RegisterScreen(),
          ],
        ),
      ),
    );
  }
}
