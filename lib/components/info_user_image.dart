import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_box_shadow.dart';

class InfoUserImage extends StatelessWidget {
  const InfoUserImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.w,
      decoration: BoxDecoration(
        image: image.isEmpty
            ? null
            : DecorationImage(image: CachedNetworkImageProvider(image)),
        color: ColorApp.backgroundColor,
        boxShadow: [styleBoxShadow.backBoxShadow],
        borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
      ),
    );
  }
}
