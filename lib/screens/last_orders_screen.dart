import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/products_bloc/products_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/models/orders_model.dart';
import 'package:mars/style/style_box_shadow.dart';
import 'package:mars/bloc/orders_bloc/orders_states.dart';
import 'package:mars/bloc/orders_bloc/orders_cubit.dart';

import '../components/info_user_porfale_bar.dart';
import '../custom/custom_welcome_bar.dart';
import '../style/style_text_description.dart';
import '../widgets/text_localization.dart';

class LastOrdersScreen extends StatelessWidget {
  const LastOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OrdersCubit.get(context);
          return Scaffold(
            backgroundColor: ColorApp.backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  InfoUserProfleBar(
                    titelScreenMsg: "last_orders_titel_msg",
                    endIcon: SizedBox(width: 60.w),
                  ),
                  CustomWelcomeBar(
                    subtitle: TextLocalization(
                      text: "orders_for_last_month_msg",
                      style: styleTextDescription(),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.ordersModel.orders!.length,
                      itemBuilder: (context, index) => InfoLastOrderCard(
                          orderDetails: cubit.ordersModel.orders![index]!),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class InfoLastOrderCard extends StatelessWidget {
  const InfoLastOrderCard({super.key, required this.orderDetails});
  final Order orderDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      width: SizeApp.screenWidth! * 1,
      decoration: BoxDecoration(
        color: ColorApp.backgroundColor,
        boxShadow: [styleBoxShadow.backBoxShadow],
        borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: ColorApp.backgroundColor,
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  fetchProductImage(
                      context, orderDetails.orderitems![0]!.productid),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                orderDetails.orderstatus!,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontApp.bigText,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.titelColor,
                ),
              ),
              Text(
                orderDetails.orderdatecreated!,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: fontApp.mediumText,
                  fontWeight: FontWeight.w300,
                  color: ColorApp.descriptionColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  orderDetails.totalprice!,
                  style: TextStyle(
                    fontSize: SizeApp.smallTextSize,
                    fontFamily: fontApp.mediumText,
                    fontWeight: FontWeight.w300,
                    color: ColorApp.textColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String fetchProductImage(context, productName) {
  int index = BlocProvider.of<ProductsCubit>(context)
      .productsModel
      .products!
      .indexWhere((e) => e.id!.contains(productName));
  return BlocProvider.of<ProductsCubit>(context)
      .productsModel
      .products![index]
      .productimage![0];
}
