import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_text_hint.dart';

class InputText extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool odscureText;
  final String hintTextMsg;
  final String suffixIcon;
  final String prefixIcon;
  final VoidCallback suffixOnPreesd;
  final void Function(String?) onChanged;
  final TextInputType keyboardType;
  List<FilteringTextInputFormatter>? formatters = [];
  InputText({
    super.key,
    required this.validator,
    this.formatters,
    required this.controller,
    required this.odscureText,
    required this.hintTextMsg,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.suffixOnPreesd,
    required this.onChanged,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: TextFormField(
        inputFormatters: formatters,
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorErrorColor: ColorApp.erorrColor,
        textCapitalization: TextCapitalization.words,
        cursorColor: ColorApp.primerColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.erorrColor),
          ),
          border: InputBorder.none,
          hintText: hintTextMsg.tr(context),
          helperStyle: styleTextHint(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
            borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
          ),
          fillColor: ColorApp.auxiliaryColor.withOpacity(0.1),
          prefixIcon: Container(
            margin: EdgeInsets.all(7.r),
            child: SvgPicture.asset(
              prefixIcon,
              color: ColorApp.primerColor,
            ),
          ),
          suffix: GestureDetector(
            onTap: suffixOnPreesd,
            child: SvgPicture.asset(
              suffixIcon,
              color: ColorApp.titelColor,
              width: 20.w,
            ),
          ),
          filled: true,
        ),
        obscureText: odscureText,
      ),
    );
  }
}
