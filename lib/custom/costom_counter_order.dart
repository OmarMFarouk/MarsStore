import 'package:flutter/material.dart';
import 'package:mars/core/color_app.dart';

class CustomCounterOrders extends StatelessWidget {
  const CustomCounterOrders({
    super.key,
    required this.onIncrement,
    required this.quantity,
    required this.onDecrement,
  });
  final String quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onIncrement,
          icon: Icon(
            Icons.add,
            color: ColorApp.textColor,
            size: 25,
          ),
        ),
        Text(
          quantity,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        IconButton(
          onPressed: onDecrement,
          icon: Icon(
            Icons.remove,
            color: ColorApp.textColor,
            size: 25,
          ),
        ),
      ],
    );
  }
}
