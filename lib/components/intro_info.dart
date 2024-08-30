import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/intro_screen/intro_bloc.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/intro_functions.dart';
import 'package:mars/widgets/hero_animated_widget.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/logo_box_mars.dart';

class IntroInfo extends StatelessWidget {
  const IntroInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth,
      height: SizeApp.screenHeight,
      decoration: BoxDecoration(
        color: ColorApp.titelColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1),
            BlendMode.dstATop,
          ),
          image: AssetImage(imageApp.wallpaper),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<IntroBloc, IntroState>(
              builder: (context, state) {
                state = IntroAnimatedLogoState(isAnimated: true);
                return HeroAnimatedWidget(
                  crossFadeState: introFunctions.isIntro,
                  firstChild: Container(),
                  secondChild: const LogoBoxMars(),
                );
              },
            ),
            BlocBuilder<IntroBloc, IntroState>(
              builder: (context, state) {
                return HeroAnimatedWidget(
                  crossFadeState: introFunctions.isIntro,
                  firstChild: Container(),
                  secondChild: Column(
                    children: [
                      HeroButton(
                        widthSize: SizeApp.screenWidth! * 1,
                        onPressed: () => introFunctions.goToLogin(),
                        text: "login_batton_msg",
                        svgIcon: iconApp.loginIcon,
                        isBorder: false,
                        isIcon: false,
                      ),
                      HeroButton(
                        widthSize: SizeApp.screenWidth! * 1,
                        onPressed: () => introFunctions.goToRegister(),
                        text: "register_now_msg",
                        svgIcon: iconApp.getStartedIcon,
                        isBorder: true,
                        isIcon: false,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
