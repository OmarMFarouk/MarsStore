import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';

class HeroIcon extends StatelessWidget {
  const HeroIcon({
    super.key,
    required this.onPressed,
    required this.svgIcon,
  });

  final VoidCallback onPressed;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.buttonHeghtSize,
      height: SizeApp.buttonHeghtSize,
      decoration: BoxDecoration(
        color: ColorApp.primerColor,
        borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          svgIcon,
          color: ColorApp.backgroundColor,
        ),
      ),
    );
  }
}
