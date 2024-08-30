import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/custom/custom_check_box.dart';
import 'package:mars/custom/custom_search_bar.dart';

class InfoItemsFelterSearsh extends StatelessWidget {
  const InfoItemsFelterSearsh({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.tr(context),
          style: TextStyle(
            color: ColorApp.textColor,
          ),
        ),
        CustomCheckbox(
          value: filterValue == text ? true : false,
          onChanged: (value) {},
        )
      ],
    );
  }
}
