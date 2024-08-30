import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/user_name.dart';

class CustomWelcomeBar extends StatelessWidget {
  CustomWelcomeBar({
    super.key,
    this.subtitle,
  });
  Widget? subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(10.w),
      width: SizeApp.screenWidth,
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: ColorApp.primerColor,
            foregroundImage: localUserData.userinfo!.image!.isEmpty
                ? null
                : CachedNetworkImageProvider(localUserData.userinfo!.image!),
          ),
          title: Text(
            "${"welcome_user_msg".tr(context)} ${extractFirstName()}",
            style: TextStyle(
              fontSize: SizeApp.mediumTextSize,
              fontFamily: fontApp.bigText,
              fontWeight: FontWeight.w300,
              color: ColorApp.primerColor,
            ),
          ),
          subtitle: subtitle),
    );
  }
}
