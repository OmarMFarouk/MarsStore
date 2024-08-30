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

class SingUpFaceBookFunctions {
  String? errorText;

  // sign up with google
  final GlobalKey<FormState> signUpFaceBookFormKey = GlobalKey<FormState>();
  String? validatorFaceBookEmail(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_account_msg".tr(context);
      return errorText;
    }
    return null;
  }

  String? validatorFaceBookPasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "entet_passwerd_msg".tr(context);
      return errorText;
    }
    return null;
  }

  void signUpWithFaceBook(BuildContext context) async {
    if (signUpFaceBookFormKey.currentState!.validate()) {
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
      if (inputTextController.faceBookEmailControiier.text == "" &&
          inputTextController.faceBookPasswerdControiier.text == "") {
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

SingUpFaceBookFunctions singUpFaceBookFunctions = SingUpFaceBookFunctions();
