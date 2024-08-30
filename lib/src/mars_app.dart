import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/bloc/cart_bloc/cart_states.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';
import 'package:mars/components/info_navgitor_bar.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/custom_app_bar.dart';
import 'package:mars/functions/navgator_bat_functions.dart';
import 'package:mars/functions/refresh_app_functions.dart';
import 'package:mars/models/navigator_bar_moodel.dart';

class MarsApp extends StatelessWidget {
  const MarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: RefreshIndicator(
        onRefresh: () => RefreshAppFunctions().onRefresh(context),
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        backgroundColor: ColorApp.backgroundColor,
        color: ColorApp.primerColor,
        child: Column(
          children: [
            // App Bar
            const CustomAppBar(),

            // viow screens for app
            BlocBuilder<NavigatorBarBloc, NavigatorBarState>(
              builder: (context, state) {
                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: navigatorBarModel
                        // 1- home scren
                        // 2- user car shopping screen
                        // 3- user old orders screen
                        // 4- setting scren
                        .navigatorList[blocNavigator.currenIndex]
                        .screen,
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // navgitor bar
      bottomNavigationBar: BlocBuilder<NavigatorBarBloc, NavigatorBarState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            padding: EdgeInsets.all(10.w),
            width: SizeApp.screenWidth! * 1,
            height: 55.h,
            decoration: BoxDecoration(
              color: ColorApp.backgroundColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  navigatorBarModel.navigatorList.length,
                  (index) => GestureDetector(
                    onTap: () =>
                        navgatorBatFunctions.navigtorButton(context, index),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        InfoNavgitorBar(
                          index: index,
                          currenIndex: blocNavigator.currenIndex,
                        ),
                        index == 1
                            ? BlocConsumer<CartCubit, CartStates>(
                                listener: (context, state) {},
                                builder: (context, state) =>
                                    CartCubit.get(context)
                                            .cartModel
                                            .cartitems!
                                            .isNotEmpty
                                        ? CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 8,
                                            child: Text(
                                              CartCubit.get(context)
                                                  .cartModel
                                                  .cartitems!
                                                  .length
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )
                                        : const SizedBox(),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
