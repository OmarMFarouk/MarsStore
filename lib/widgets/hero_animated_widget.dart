import 'package:flutter/material.dart';

class HeroAnimatedWidget extends StatelessWidget {
  const HeroAnimatedWidget({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.crossFadeState,
  });
  final Widget firstChild;
  final Widget secondChild;
  final bool crossFadeState;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.bottomCenter,
      firstCurve: Curves.easeIn,
      reverseDuration: const Duration(milliseconds: 500),
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          crossFadeState ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 600),
    );
  }
}
