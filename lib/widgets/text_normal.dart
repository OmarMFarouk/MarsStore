import 'package:flutter/material.dart';

class TextNormal extends StatelessWidget {
  const TextNormal({
    super.key,
    required this.text,
    required this.style,
  });
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
