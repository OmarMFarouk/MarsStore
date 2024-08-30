import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';

import '../core/size_app.dart';
import '../style/style_box_shadow.dart';

class InfoEditUserImage extends StatelessWidget {
  const InfoEditUserImage({
    super.key,
    required this.onPressed,
    required this.image,
  });
  final VoidCallback onPressed;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150.w,
          height: 150.w,
          decoration: BoxDecoration(
            image: image.isEmpty
                ? null
                : DecorationImage(image: FileImage(File(image))),
            color: ColorApp.backgroundColor,
            boxShadow: [styleBoxShadow.backBoxShadow],
            borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
          ),
        ),
        image.isNotEmpty
            ? const SizedBox()
            : Container(
                width: 150.w,
                height: 150.w,
                child: IconButton(
                  onPressed: onPressed,
                  icon: localUserData.userinfo!.image!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: localUserData.userinfo!.image!)
                      : SvgPicture.asset(
                          iconApp.cameraIcon,
                          width: 50.w,
                          color: ColorApp.titelColor,
                        ),
                ),
              ),
      ],
    );
  }
}
