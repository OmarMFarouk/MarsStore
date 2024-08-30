import 'package:flutter/material.dart';
import 'package:mars/core/localizations_app.dart';

class TextLocalization extends StatelessWidget {
  const TextLocalization({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(context),
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
