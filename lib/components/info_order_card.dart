import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/costom_counter_order.dart';
import 'package:mars/models/cart_model.dart';
import 'package:mars/style/style_box_shadow.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_hint.dart';
import 'package:mars/style/style_text_titel.dart';

import '../core/icon_app.dart';
import 'info_items_felter_search.dart';

class InfoOrderCard extends StatelessWidget {
  const InfoOrderCard({super.key, required this.cartItemDetails});
  final CartItem cartItemDetails;

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
                  cartItemDetails.productimage!,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  cartItemDetails.productname!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: fontApp.bigText,
                    fontWeight: FontWeight.w700,
                    color: ColorApp.titelColor,
                  ),
                ),
                Text(
                  '${"size".tr(context)}: ${cartItemDetails.productSize!}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: fontApp.bigText,
                    fontWeight: FontWeight.w700,
                    color: ColorApp.erorrColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    '${cartItemDetails.productprice!} ${'currency'.tr(context)}',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: SizeApp.smallTextSize,
                      fontFamily: fontApp.mediumText,
                      fontWeight: FontWeight.w300,
                      color: ColorApp.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).deleteCartItem(
                      productId: cartItemDetails.productid!,
                      productSize: cartItemDetails.productSize!);
                  BlocProvider.of<CartCubit>(context)
                      .cartModel
                      .cartitems!
                      .removeAt(BlocProvider.of<CartCubit>(context)
                          .cartModel
                          .cartitems!
                          .indexOf(cartItemDetails));
                },
                icon: SvgPicture.asset(
                  iconApp.deleteIcon,
                  color: ColorApp.erorrColor,
                  width: 25.w,
                ),
              ),
              CustomCounterOrders(
                  quantity: cartItemDetails.quantity!,
                  onDecrement: () {
                    if (cartItemDetails.quantity != '1') {
                      BlocProvider.of<CartCubit>(context).incrementCartItem(
                          productId: cartItemDetails.productid!,
                          productSize: cartItemDetails.productSize!,
                          newQuantity:
                              (int.parse(cartItemDetails.quantity!) - 1)
                                  .toString());
                      BlocProvider.of<CartCubit>(context)
                          .cartModel
                          .cartitems![BlocProvider.of<CartCubit>(context)
                              .cartModel
                              .cartitems!
                              .indexOf(cartItemDetails)]!
                          .quantity = (int.parse(
                                  BlocProvider.of<CartCubit>(context)
                                      .cartModel
                                      .cartitems![
                                          BlocProvider.of<CartCubit>(context)
                                              .cartModel
                                              .cartitems!
                                              .indexOf(cartItemDetails)]!
                                      .quantity
                                      .toString()) -
                              1)
                          .toString();
                    }
                  },
                  onIncrement: () {
                    BlocProvider.of<CartCubit>(context).incrementCartItem(
                        productSize: cartItemDetails.productSize!,
                        productId: cartItemDetails.productid!,
                        newQuantity: (int.parse(cartItemDetails.quantity!) + 1)
                            .toString());
                    BlocProvider.of<CartCubit>(context)
                        .cartModel
                        .cartitems![BlocProvider.of<CartCubit>(context)
                            .cartModel
                            .cartitems!
                            .indexOf(cartItemDetails)]!
                        .quantity = (int.parse(
                                BlocProvider.of<CartCubit>(context)
                                    .cartModel
                                    .cartitems![
                                        BlocProvider.of<CartCubit>(context)
                                            .cartModel
                                            .cartitems!
                                            .indexOf(cartItemDetails)]!
                                    .quantity
                                    .toString()) +
                            1)
                        .toString();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
