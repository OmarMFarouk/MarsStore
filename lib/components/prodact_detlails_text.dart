import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';

class ProdactDetlailsText extends StatelessWidget {
  const ProdactDetlailsText({
    super.key,
    required this.detlailsText,
  });
  final String detlailsText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        textAlign: TextAlign.start,
        detlailsText,
        style: TextStyle(
          color: ColorApp.supColor,
          fontSize: 16.r,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
