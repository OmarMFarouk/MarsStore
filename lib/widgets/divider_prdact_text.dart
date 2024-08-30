import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/widgets/text_localization.dart';

class DividerProdctText extends StatelessWidget {
  const DividerProdctText({
    super.key, required this.textDevider,
  });
  final String textDevider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextLocalization(
              text: textDevider,
              style: TextStyle(
                fontFamily: fontApp.heroText,
                fontSize: 17.0,
                color: ColorApp.supColor,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Divider(color: ColorApp.supColor),
          ),
        ],
      ),
    );
  }
}
