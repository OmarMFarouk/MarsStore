import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/bloc/cart_bloc/cart_states.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/components/info_order_card.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/custom_titel_bar.dart';
import 'package:mars/functions/detlails_functions.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/logo_box_mars.dart';
import 'package:mars/widgets/myformfield.dart';

import '../../models/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          calcTotal(cubit.cartModel.cartitems!);
          return Scaffold(
            backgroundColor: ColorApp.backgroundColor,
            body: Column(
              children: [
                const CustomTitelBar(text: "shopping_car_titel_msg"),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.cartModel.cartitems!.length,
                    itemBuilder: (context, index) => InfoOrderCard(
                      cartItemDetails: cubit.cartModel.cartitems![index]!,
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: cubit.cartModel.cartitems!.isEmpty
                ? const SizedBox()
                : Container(
                    height: SizeApp.buttonHeghtSize! + 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${"delivery_fee".tr(context)}: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.descriptionColor),
                                  ),
                                  Text(
                                    '80',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.descriptionColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${"subtotal".tr(context)}: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.descriptionColor),
                                  ),
                                  Text(
                                      calcTotal(cubit.cartModel.cartitems!)
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ColorApp.descriptionColor))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${"total_price_msg".tr(context)}: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.descriptionColor),
                                  ),
                                  Text(
                                      '${(calcTotal(cubit.cartModel.cartitems!) + 80).toStringAsFixed(2)} ${"currency".tr(context)}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorApp.erorrColor))
                                ],
                              ),
                            ],
                          ),
                        ),
                        HeroButton(
                          onPressed: () async {
                            final formKey = GlobalKey<FormState>();
                            if (cubit.cartModel.cartitems!.isNotEmpty) {
                              cubit.addressCont.text =
                                  localUserData.userinfo!.userAddress!;
                              cubit.phoneCont.text =
                                  localUserData.userinfo!.phone!;
                              await showModalBottomSheet(
                                  isDismissible: false,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorApp.primerColor,
                                                width: 7.5)),
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Form(
                                          key: formKey,
                                          child: ListView(
                                            children: [
                                              const LogoBoxMars(),
                                              MyFormField(
                                                  icon: CupertinoIcons.phone,
                                                  validator: (s) {
                                                    if (s!.isEmpty) {
                                                      return '*Empty';
                                                    } else if (s.length < 10) {
                                                      return '*Invalid';
                                                    }
                                                    return null;
                                                  },
                                                  controller: cubit.phoneCont,
                                                  hintTextMsg: 'hint_phone',
                                                  keyboardType:
                                                      TextInputType.number),
                                              MyFormField(
                                                  icon: CupertinoIcons
                                                      .location_solid,
                                                  validator: (s) {
                                                    if (s!.isEmpty) {
                                                      return '*Empty';
                                                    }
                                                    if (s.length < 5) {
                                                      return '*Invalid';
                                                    }
                                                    return null;
                                                  },
                                                  controller: cubit.addressCont,
                                                  hintTextMsg: 'hint_address',
                                                  keyboardType:
                                                      TextInputType.multiline),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      '${"total_price_msg".tr(context)}: ${(calcTotal(cubit.cartModel.cartitems!) + 80).toStringAsFixed(2)} ${"currency".tr(context)}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: ColorApp
                                                              .erorrColor)),
                                                  HeroButton(
                                                    text: "buy_now_orders_msg",
                                                    svgIcon: "",
                                                    isBorder: false,
                                                    isIcon: false,
                                                    widthSize:
                                                        SizeApp.screenWidth! /
                                                            3,
                                                    onPressed: () async {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Center(
                                                child: Text(
                                                    "hint_order".tr(context),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorApp
                                                            .hintColor)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                              if (formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: Container(
                                            height: 50,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: ColorApp.primerColor,
                                              ),
                                            ),
                                          ),
                                        ));

                                await cubit.createOrder(
                                    orderItems: cubit.cartModel.cartitems!,
                                    context: context,
                                    totalQuantity: calcQuantity(
                                        cubit.cartModel.cartitems!),
                                    totalPrice:
                                        (calcTotal(cubit.cartModel.cartitems!) +
                                                80)
                                            .toStringAsFixed(2));
                                Navigator.pop(context);

                                DetlailsFunctions().shopping(context);
                              }
                            }
                          },
                          text: "buy_now_orders_msg",
                          svgIcon: "",
                          isBorder: false,
                          isIcon: false,
                          widthSize: SizeApp.screenWidth! / 2,
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}

double calcTotal(List<CartItem?> cartItems) {
  double sum = 0;
  for (var i = 0; i < cartItems.length; i++) {
    double itemPrice = double.parse(cartItems[i]!.productprice!) *
        double.parse(cartItems[i]!.quantity!);
    sum = sum + itemPrice;
  }
  return sum;
}

String calcQuantity(List<CartItem?> cartItems) {
  int sum = 0;
  for (var i = 0; i < cartItems.length; i++) {
    int itemQuantity = int.parse(cartItems[i]!.quantity!);
    sum = sum + itemQuantity;
  }
  return sum.toString();
}
