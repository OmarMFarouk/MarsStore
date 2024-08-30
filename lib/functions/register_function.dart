import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/otp_screen/otp_bloc.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/functions/show_error_dialog.dart';
import 'package:mars/functions/user_name.dart';
import 'package:mars/screens/auth/otp_screen.dart';

class RegisterFunction {
  final GlobalKey<FormState> regidterFormKey = GlobalKey<FormState>();
  String? errorText;
  String? validatorRegisterUserName(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_name_msg".tr(context);
      return errorText;
    }
    return null;
  }

  String? validatorRegisterEmail(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_email_msg".tr(context);
      return errorText;
    } else {
      const emailRegex =
          r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*";
      if (RegExp(emailRegex).hasMatch(value)) {
        return null;
      } else {
        errorText = "email_regex_msg".tr(context);
        return errorText;
      }
    }
  }

  String? validatorRegisterPhoneNumber(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_phone_msg".tr(context);
      return errorText;
    }
    return null;
  }

  String? validatorRegisterPasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_new_passwerd_msg".tr(context);
      return errorText;
    } else {
      if (value.length > 8) {
        errorText = "passwerd_langth_error_msg".tr(context);
      }
      return null;
    }
  }

  String? validatorRegisterAgenPasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "agan_passwerd_msg".tr(context);
      return errorText;
    } else {
      if (inputTextController.userPasswerdController.text !=
          inputTextController.passwerdAgainController.text) {
        errorText = "mismatched_passwerd".tr(context);
        return errorText;
      }
      return null;
    }
  }

  void registerButton(BuildContext context, bool success, msg) async {
    if (success == true) {
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
          create: (context) => OtpBloc(),
          child: const OtpScreen(),
        ),
      );
    } else {
      //

      showErrorDialog(
        context,
        imageApp.chekError,
        msg,
        "",
        true,
      );
    }
  }
}

RegisterFunction registerFunction = RegisterFunction();
