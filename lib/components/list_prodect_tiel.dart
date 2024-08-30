import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_titel.dart';

class ListProdectTiel extends StatelessWidget {
  const ListProdectTiel({
    super.key,
    required this.titelProcat,
    required this.descriptionProdact,
    required this.price,
  });

  final String titelProcat, descriptionProdact, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          textAlign: TextAlign.start,
          titelProcat,
          style: styleTextTitel(),
        ),
        subtitle: Text(
          textAlign: TextAlign.start,
          descriptionProdact,
          style: styleTextDescription(),
        ),
        trailing: Text(
          "$price " + "currency".tr(context),
          style: TextStyle(
            fontSize: 25,
            fontFamily: fontApp.bigText,
            fontWeight: FontWeight.w700,
            color: ColorApp.titelColor,
          ),
        ),
      ),
    );
  }
}
