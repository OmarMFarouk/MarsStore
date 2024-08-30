import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_text_hint.dart';

class MyFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final String hintTextMsg;
  final IconData icon;
  final TextInputType keyboardType;
  MyFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.icon,
    required this.hintTextMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
      child: TextFormField(
        inputFormatters: hintTextMsg == 'hint_phone'
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        validator: validator,
        controller: controller,
        maxLines: hintTextMsg == 'hint_address' ? 2 : null,
        textInputAction: TextInputAction.done,
        cursorErrorColor: ColorApp.erorrColor,
        textCapitalization: TextCapitalization.words,
        cursorColor: ColorApp.primerColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.erorrColor),
          ),
          border: InputBorder.none,
          suffixIcon: Icon(
            icon,
            color: ColorApp.primerColor,
          ),
          labelText: hintTextMsg.tr(context),
          labelStyle: styleTextHint(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
            borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
          ),
          fillColor: ColorApp.auxiliaryColor.withOpacity(0.1),
          filled: true,
        ),
      ),
    );
  }
}
