import 'package:flutter/material.dart';
import 'package:mars/components/info_user_orgnal.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/forget_passwerd_functions.dart';
import 'package:mars/widgets/hero_button.dart';

class ForgetPasswerdScreen extends StatelessWidget {
  const ForgetPasswerdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: Form(
        key: forgetPasswerdFunctions.forgetPasswerdFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoUserOrgnal(
              controller: TextEditingController(),
              validator: (value) => forgetPasswerdFunctions
                  .validatorForgetPasswerd(value, context),
            ),
            // SizedBox(height: 50.h),
            HeroButton(
              onPressed: () => forgetPasswerdFunctions.forgetPAsswerdbutton(
                context,
              ),
              text: "forgot_basswerd_msg",
              svgIcon: iconApp.infoIcon,
              isBorder: false,
              isIcon: true,
              widthSize: SizeApp.screenWidth as double,
            ),
          ],
        ),
      ),
    );
  }
}
