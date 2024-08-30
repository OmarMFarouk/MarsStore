import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/functions/show_error_dialog.dart';
import 'package:mars/functions/user_name.dart';
import 'package:mars/src/mars_app.dart';

class SingUpGoogleFunctions {
  String? errorText;

  // sign up with faceBook
  final GlobalKey<FormState> signUpGoogleFormKey = GlobalKey<FormState>();
  String? validatorGoogleEmail(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_account_msg".tr(context);
      return errorText;
    }
    return null;
  }

  String? validatorGooglePasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "entet_passwerd_msg".tr(context);
      return errorText;
    }
    return null;
  }

  void signUpWithGoogle(BuildContext context) async {
    if (signUpGoogleFormKey.currentState!.validate()) {
      showErrorDialog(
        context,
        imageApp.checkCorrect,
        "correct_email_msg".tr(context),
        "${"welcome_user_msg".tr(context)} ${extractFirstName()}",
        false,
      );
      await Future.delayed(const Duration(seconds: 5));
      navgaterFunction(
        context,
        BlocProvider(
          create: (context) => NavigatorBarBloc(),
          child: const MarsApp(),
        ),
      );
    } else {
      //
      if (inputTextController.googleEmailControiier.text == "" &&
          inputTextController.googlePasswerdControiier.text == "") {
        errorText = "enter_all_data_msg".tr(context);
        showErrorDialog(
          context,
          imageApp.chekError,
          errorText!,
          "",
          true,
        );
      } else {
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
}

SingUpGoogleFunctions singUpGoogleFunctions = SingUpGoogleFunctions();
