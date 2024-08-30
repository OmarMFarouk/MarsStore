import 'package:flutter/material.dart';
import 'package:mars/controllers/input_text_controller.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/widgets/input_text.dart';

class InfoUserOrgnal extends StatelessWidget {
  const InfoUserOrgnal(
      {super.key, required this.validator, required this.controller});
  final FormFieldValidator validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return InputText(
      controller: controller,
      validator: validator,
      onChanged: (saveValue) {
        // FocusScope.of(context).nextFocus();
      },
      suffixOnPreesd: () {
        inputTextController.userOriginalController.text = "";
      },
      odscureText: false,
      hintTextMsg: "hint_user_logon_id_msg",
      prefixIcon: iconApp.emailIcon,
      suffixIcon: iconApp.removTextIcon,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
