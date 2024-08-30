import 'package:flutter/material.dart';
import 'package:mars/functions/otp_functions.dart';
import 'package:mars/widgets/input_otp.dart';

class OtpFormInfo extends StatelessWidget {
  const OtpFormInfo(
      {super.key,
      required this.otp1,
      required this.otp2,
      required this.otp3,
      required this.otp4});
  final TextEditingController otp1;
  final TextEditingController otp2;
  final TextEditingController otp3;
  final TextEditingController otp4;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InpotOtp(
          controller: otp1,
          validator: (otp1) => otpFunctions.validatorOtp1(otp1, context),
        ),
        InpotOtp(
          controller: otp2,
          validator: (otp2) => otpFunctions.validatorOtp2(otp2, context),
        ),
        InpotOtp(
          controller: otp3,
          validator: (otp3) => otpFunctions.validatorOtp3(otp3, context),
        ),
        InpotOtp(
          controller: otp4,
          validator: (otp4) => otpFunctions.validatorOtp4(otp4, context),
        ),
      ],
    );
  }
}
