import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/intro_screen/intro_bloc.dart';
import 'package:mars/bloc/onboeding_screen/onbording_bloc.dart';
import 'package:mars/components/onbording_info.dart';
import 'package:mars/components/onbording_next_button.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/functions/onbotding_functions.dart';
import 'package:mars/models/onbordind_model.dart';
import 'package:mars/screens/auth/intro_screen.dart';
import 'package:mars/services/location.dart';
import 'package:mars/src/app_shared.dart';
import 'package:mars/style/style_text_button.dart';
import 'package:mars/widgets/hero_animated_widget.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/text_localization.dart';

import '../../services/firebase_msg.dart';

class OnbordeingScreen extends StatelessWidget {
  const OnbordeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // text button for skip onbording screen
            BlocBuilder<OnbordingBloc, OnbordingState>(
              builder: (context, state) {
                return Container(
                  height: 50.h,
                  margin: const EdgeInsets.all(10.0),
                  child: HeroAnimatedWidget(
                    crossFadeState: onbotdingFunctions.isLastPage,
                    firstChild: TextButton(
                      onPressed: () => onbotdingFunctions.skipOnbordingButton(),
                      child: TextLocalization(
                        text: "skip_onbotding_msg",
                        style: styleTextButton(),
                      ),
                    ),
                    secondChild: const SizedBox(),
                  ),
                );
              },
            ),

            // onbording model viow
            Expanded(
              child: BlocBuilder<OnbordingBloc, OnbordingState>(
                builder: (context, state) {
                  return PageView.builder(
                    controller: onbotdingFunctions.pageController,
                    onPageChanged: (changed) =>
                        onbotdingFunctions.onChanged(changed, context),
                    itemCount: onbordindModel.onbordeingList.length,
                    itemBuilder: (context, index) => OnbordingInfo(
                      imageSrc: onbordindModel.onbordeingList[index].imageSrc,
                      titel: onbordindModel.onbordeingList[index].titel,
                      description:
                          onbordindModel.onbordeingList[index].description,
                    ),
                  );
                },
              ),
            ),

            // next button for onbordeing screens
            BlocBuilder<OnbordingBloc, OnbordingState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeroAnimatedWidget(
                    crossFadeState: onbotdingFunctions.isLastPage,
                    firstChild: OnbordingNextButton(
                      onPressed: () => onbotdingFunctions.onbordingNextButton(
                        context,
                      ),
                    ),
                    secondChild: HeroButton(
                      isBorder: false,
                      isIcon: true,
                      widthSize: SizeApp.screenWidth! * 1,
                      onPressed: () async {
                        await showCupertinoDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                shape:
                                                    const WidgetStatePropertyAll(
                                                        BeveledRectangleBorder()),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        ColorApp.primerColor)),
                                            onPressed: () async {
                                              await NotificationService()
                                                  .initFCM();
                                              await LocationService()
                                                  .requestPermission();
                                              await AppShared.localStorage
                                                  .setBool('permissionGranted',
                                                      true);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OKAY')),
                                      ],
                                    ),
                                  ],
                                  content: Text(
                                    'Mars Store\nrequires the location and notification permissions to ensure best user experience',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorApp.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ));
                        navgaterFunction(
                            context,
                            BlocProvider(
                              create: (context) => IntroBloc(),
                              child: const IntroScreen(),
                            ));
                      },
                      text: "get_started_msg",
                      svgIcon: iconApp.getStartedIcon,
                    ),
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
