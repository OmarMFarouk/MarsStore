import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/custom/custom_titel_bar.dart';
import 'package:mars/bloc/orders_bloc/orders_states.dart';
import 'package:mars/bloc/orders_bloc/orders_cubit.dart';
import 'package:mars/screens/last_orders_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OrdersCubit.get(context);
          return Scaffold(
            backgroundColor: ColorApp.backgroundColor,
            body: Column(
              children: [
                const CustomTitelBar(text: "orders_titel_msg"),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.ordersModel.orders!.length,
                    itemBuilder: (context, index) => InfoLastOrderCard(
                        orderDetails: cubit.ordersModel.orders![index]!),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
