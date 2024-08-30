// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  final BoxShape shape;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.shape = BoxShape.circle, // Use BoxShape instead of ShapeBorder
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCheckbox() {
    final newValue = !widget.value;
    widget.onChanged(newValue);
    _animationController.animateTo(newValue ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.value ? ColorApp.primerColor : ColorApp.backgroundColor,
          shape: widget.shape,
          // borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
          border: Border.all(color: ColorApp.primerColor),
        ),
        child: AnimatedScale(
          scale: _animation.value,
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              Icons.check,
              color: ColorApp.iconColor,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
