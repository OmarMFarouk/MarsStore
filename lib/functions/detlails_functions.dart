import 'package:flutter/material.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/show_error_dialog.dart';

class DetlailsFunctions {
  String textError = "";
  void bookMark(BuildContext context) {
    textError = "add_book_mark_msg".tr(context);
    showErrorDialog(context, imageApp.checkCorrect, textError, "", true);
  }

  void addToCar(BuildContext context) {
    textError = "add_to_car_msg".tr(context);
    showErrorDialog(context, imageApp.checkCorrect, textError, "", true);
  }

  void shopping(BuildContext context) {
    textError = "order_is_ready_msg".tr(context);
    showErrorDialog(context, imageApp.checkCorrect, textError, "", true);
  }
}

DetlailsFunctions detlailsFunctions = DetlailsFunctions();
