import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/components/info_user_passwerd.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/sing_up_face_book_functions.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/input_text.dart';
import 'package:mars/widgets/logo_box_face_book.dart';
import 'package:mars/widgets/text_localization.dart';

class SignFacebookScreen extends StatelessWidget {
  const SignFacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: singUpFaceBookFunctions.signUpFaceBookFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                // logo app
                const FacBookLogoBox(),
                SizedBox(height: 30.h),

                // welcome titel
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: TextLocalization(
                    text: "sign_with_face_book_msg",
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
                  controller: inputTextController.faceBookEmailControiier,
                  odscureText: false,
                  hintTextMsg: "faceBook_email_msg",
                  suffixIcon: iconApp.removTextIcon,
                  prefixIcon: iconApp.emailIcon,
                  suffixOnPreesd: () {
                    inputTextController.faceBookEmailControiier.text = "";
                  },
                  onChanged: (p0) {},
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 15.h),

                // inpout user passwerd
                InfoUserPasswerd(
                  hintTextMsg: "hint_user_passwerd_msg",
                  controller: inputTextController.faceBookPasswerdControiier,
                  validator: (value) =>
                      singUpFaceBookFunctions.validatorFaceBookPasswerd(
                    value,
                    context,
                  ),
                ),

                // Sign up button
                HeroButton(
                  onPressed: () =>
                      singUpFaceBookFunctions.signUpWithFaceBook(context),
                  text: "sign_up_faceBook_msg",
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

