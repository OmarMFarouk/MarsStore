import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';

class InpotOtp extends StatelessWidget {
  const InpotOtp(
      {super.key, required this.validator, required this.controller});
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          hintText: "0",
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.erorrColor),
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
            borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primerColor),
          ),
          fillColor: ColorApp.auxiliaryColor.withOpacity(0.1),
        ),
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
