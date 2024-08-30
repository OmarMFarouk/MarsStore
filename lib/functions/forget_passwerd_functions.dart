import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/otp_screen/otp_bloc.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/functions/show_error_dialog.dart';
import 'package:mars/screens/auth/otp_screen.dart';

class ForgetPasswerdFunctions {
  final GlobalKey<FormState> forgetPasswerdFormKey = GlobalKey<FormState>();
  String? errorText;

  String? validatorForgetPasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_account_msg".tr(context);
      return errorText;
    }
    return null;
  }

  void forgetPAsswerdbutton(BuildContext context) async {
    if (forgetPasswerdFormKey.currentState!.validate()) {
      showErrorDialog(
        context,
        imageApp.checkSearch,
        "correct_email_msg".tr(context),
        "${"welcome_user_msg".tr(context)} user name",
        false,
      );
      await Future.delayed(const Duration(seconds: 5));
      navgaterFunction(
        context,
        BlocProvider(
          create: (context) => OtpBloc(),
          child: const OtpScreen(),
        ),
      );
    } else {
      //
      showErrorDialog(
        context,
        imageApp.chekError,
        errorText!,
        "",
        true,
      );
    }
  }
}

ForgetPasswerdFunctions forgetPasswerdFunctions = ForgetPasswerdFunctions();
