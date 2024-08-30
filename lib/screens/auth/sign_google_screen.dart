import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/components/info_user_passwerd.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/sign_up_with_google_function.dart';
import 'package:mars/functions/sing_up_face_book_functions.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/input_text.dart';
import 'package:mars/widgets/logo_box_google.dart';
import 'package:mars/widgets/text_localization.dart';

class SignGoogleScreen extends StatelessWidget {
  const SignGoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: singUpGoogleFunctions.signUpGoogleFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                // logo app
                const GoogleLogoBox(),
                SizedBox(height: 30.h),

                // welcome titel
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: TextLocalization(
                    text: "sign_with_google_msg",
                    style: styleTextDescription(),
                  ),
                ),
                SizedBox(height: 15.h),

                // inpout user faceBook account
                InputText(
                  validator: (value) =>
                      singUpFaceBookFunctions.validatorFaceBookEmail(
                    value,
                    context,
                  ),
                  controller: inputTextController.googleEmailControiier,
                  odscureText: false,
                  hintTextMsg: "google_email_msg",
                  suffixIcon: iconApp.removTextIcon,
                  prefixIcon: iconApp.emailIcon,
                  suffixOnPreesd: () {
                    inputTextController.googleEmailControiier.text = "";
                  },
                  onChanged: (p0) {},
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 15.h),

                // inpout user passwerd
                InfoUserPasswerd(
                  hintTextMsg: "hint_user_passwerd_msg",
                  controller: inputTextController.googlePasswerdControiier,
                  validator: (value) =>
                      singUpFaceBookFunctions.validatorFaceBookPasswerd(
                    value,
                    context,
                  ),
                ),

                // Sign up button
                HeroButton(
                  onPressed: () =>
                      singUpGoogleFunctions.signUpWithGoogle(context),
                  text: "sing_up_faceBook_msg",
                  svgIcon: iconApp.loginIcon,
                  isBorder: false,
                  isIcon: true,
                  widthSize: SizeApp.screenWidth! * 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
