import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';

class IndecatorBabelPackge extends StatelessWidget {
  const IndecatorBabelPackge({super.key, this.isActive = false});
  final bool? isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: SizeApp.screenWidth! * 0.035,
            width: isActive!
                ? SizeApp.screenWidth! * 0.090
                : SizeApp.screenWidth! * 0.035,
            decoration: BoxDecoration(
              color: isActive! ? ColorApp.primerColor : ColorApp.auxiliaryColor,
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
            ),
          )
        ],
      ),
    );
  }
}
