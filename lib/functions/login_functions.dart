import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';
import 'package:mars/bloc/show_passwerd/show_passwerd_bloc.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/functions/show_error_dialog.dart';
import 'package:mars/functions/user_name.dart';
import 'package:mars/screens/auth/sign_facebook_screen.dart';
import 'package:mars/screens/auth/sign_google_screen.dart';
import 'package:mars/screens/auth/splash_screen.dart';
import 'package:mars/src/mars_app.dart';

class LoginFunctions {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String? errorText;

  String? validatorUserAccount(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "enter_user_account_msg".tr(context);
      return errorText;
    } else if (value.length < 10) {
      errorText = "enter_user_account_msg".tr(context);
      return errorText;
    }
    return null;
  }

  String? validatorLoginPasswerd(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      errorText = "entet_passwerd_msg".tr(context);
      return errorText;
    } else if (value.length < 6) {
      errorText = "entet_passwerd_msg".tr(context);
      return errorText;
    }
    return null;
  }

  void loginbutton(BuildContext context, bool success, String msg) async {
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
          create: (context) => NavigatorBarBloc(),
          child: const SplashScreen(),
        ),
      );
    } else {
      //
      if (inputTextController.userOriginalController.text == "" &&
          inputTextController.userPasswerdController.text == "") {
        errorText = "enter_all_data_msg".tr(context);
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

  void showSuffixPressed(BuildContext context) {
    context.read<ShowPasswerdBloc>().add((ShowSuffixPressedEvent()));
  }

  void hiteSuffixPressed(BuildContext context) {
    context.read<ShowPasswerdBloc>().add((HideSuffixPressedEvent()));
  }

  goToSignFacebook(BuildContext context) async {
    showErrorDialog(
      context,
      imageApp.facebookSplash,
      "face_book_titel_msg".tr(context),
      "sign_with_face_book_msg".tr(context),
      false,
    );
    await Future.delayed(const Duration(seconds: 5));
    navgaterFunction(
      context,
      BlocProvider(
        create: (context) => ShowPasswerdBloc(),
        child: const SignFacebookScreen(),
      ),
    );
  }

  goToSignGoogle(BuildContext context) async {
    showErrorDialog(
      context,
      imageApp.googleSplash,
      "google_titel_msg".tr(context),
      "sign_with_google_msg".tr(context),
      false,
    );
    await Future.delayed(const Duration(seconds: 5));
    navgaterFunction(
      context,
      BlocProvider(
        create: (context) => ShowPasswerdBloc(),
        child: const SignGoogleScreen(),
      ),
    );
  }
}

LoginFunctions loginFunctions = LoginFunctions();
