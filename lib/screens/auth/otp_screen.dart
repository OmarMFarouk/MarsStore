import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/otp_screen/otp_bloc.dart';
import 'package:mars/components/otp_info.dart';
import 'package:mars/controllers/animated_controller.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/otp_functions.dart';
import 'package:mars/services/api/auth_api.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_titel.dart';
import 'package:mars/widgets/hero_animated_widget.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/text_localization.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otp1 = TextEditingController();
    TextEditingController otp2 = TextEditingController();
    TextEditingController otp3 = TextEditingController();
    TextEditingController otp4 = TextEditingController();
    animatedController.otpAnimatedController(context);
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: Form(
        key: otpFunctions.otpFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),

              // titel text
              TextLocalization(
                text: "otp_titel_msg",
                style: styleTextTitel(),
              ),
              SizedBox(height: 20.h),

              // description text
              Text(
                textAlign: TextAlign.center,
                "${"otp_description_msg".tr(context)}",
                style: styleTextDescription(),
              ),

              // otp image
              Image.asset(
                imageApp.otpImage,
                width: SizeApp.screenWidth! * 0.5,
                height: SizeApp.screenWidth! * 0.5,
              ),
              SizedBox(height: 20.h),

              // input otp
              OtpFormInfo(
                otp1: otp1,
                otp2: otp2,
                otp3: otp3,
                otp4: otp4,
              ),

              // otp button
              HeroButton(
                onPressed: () => otpFunctions.verifyOtpButtoun(context,
                    isCorrectOtp(otp1.text, otp2.text, otp3.text, otp4.text)),
                text: "verify_otp_buttom_msg",
                svgIcon: iconApp.verifyIcon,
                isBorder: false,
                isIcon: true,
                widthSize: SizeApp.screenWidth! * 1,
              ),
              SizedBox(height: 20.h),

              // send the code agin
              BlocBuilder<OtpBloc, OtpState>(
                builder: (context, state) {
                  state = OtpAnimatedState(isAnimated: true);
                  return HeroAnimatedWidget(
                    crossFadeState: otpFunctions.showSend,
                    firstChild: TextButton(
                      onPressed: () => otpFunctions.hinSendAgin(context),
                      child: Text(
                        "send_code_again_msg".tr(context),
                        style: TextStyle(
                          fontSize: SizeApp.smallTextSize,
                          fontFamily: fontApp.mediumText,
                          fontWeight: FontWeight.w300,
                          color: ColorApp.supColor,
                        ),
                      ),
                    ),
                    secondChild: TextButton(
                      onPressed: () => otpFunctions.aginSendOtp(),
                      child: Text(
                        "send_code_again_msg".tr(context),
                        style: TextStyle(
                          fontSize: SizeApp.smallTextSize,
                          fontFamily: fontApp.mediumText,
                          fontWeight: FontWeight.w300,
                          color: ColorApp.primerColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isCorrectOtp(String otp1, otp2, otp3, otp4) {
  if ('$otp1$otp2$otp3$otp4' == recentOtpCode) {
    return true;
  } else {
    return false;
  }
}
