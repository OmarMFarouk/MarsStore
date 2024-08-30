import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/style/style_box_shadow.dart';

class DetlailsProdictImage extends StatelessWidget {
  const DetlailsProdictImage({
    super.key,
    required this.prodictImage,
    required this.onChanged,
  });
  final List<String> prodictImage;
  final Function(int)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth! * 1,
      height: SizeApp.screenHeight! * 0.60,
      decoration: BoxDecoration(
        color: ColorApp.primerColor,
        boxShadow: [styleBoxShadow.primerBoxShadow],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.w),
          bottomRight: Radius.circular(30.w),
        ),
      ),
      child: PageView.builder(
        onPageChanged: (value) {
          onChanged!(value);
        },
        itemCount: prodictImage.length,
        itemBuilder: (context, index) => CustomViowProcadtImage(
          index: index,
          prodictImage: prodictImage[index],
        ),
      ),
    );
  }
}

class CustomViowProcadtImage extends StatelessWidget {
  const CustomViowProcadtImage({
    super.key,
    required this.prodictImage,
    required this.index,
  });

  final String prodictImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth! * 1,
      height: SizeApp.screenHeight! * 0.60,
      decoration: BoxDecoration(
        color: ColorApp.primerColor,
        boxShadow: [styleBoxShadow.primerBoxShadow],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.w),
          bottomRight: Radius.circular(30.w),
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(prodictImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
