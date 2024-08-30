import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/widgets/text_localization.dart';

void showErrorDialog(
  BuildContext context,
  String imageSrc,
  String titelError,
  String welcomeText,
  bool isError,
) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Container(
        width: 170.w,
        height: 170.w,
        decoration: BoxDecoration(
          color: ColorApp.backgroundColor,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageSrc),
            fit: BoxFit.cover,
          ),
        ),
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(titelError),
          ),
          Text(welcomeText),
        ],
      ),
      actions: [
        isError
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextLocalization(
                  text: "ok_msg",
                  style: TextStyle(
                    color: isError ? ColorApp.erorrColor : ColorApp.hintColor,
                  ),
                ),
              )
            : Container(),
      ],
    ),
  );
}
