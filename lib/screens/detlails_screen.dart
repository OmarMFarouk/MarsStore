import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/components/detlails_prodict_image.dart';
import 'package:mars/components/info_detiails_icon.dart';
import 'package:mars/components/info_items_felter_search.dart';
import 'package:mars/components/info_shopping_button.dart';
import 'package:mars/components/list_prodect_tiel.dart';
import 'package:mars/components/prodact_detlails_text.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/detlails_functions.dart';
import 'package:mars/models/cart_model.dart';
import 'package:mars/package/indecator_babel_packge.dart';
import 'package:mars/style/style_text_description.dart';

import '../bloc/products_bloc/products_cubit.dart';
import '../bloc/user_bloc/user_cubit.dart';
import '../widgets/hero_button.dart';
import '../widgets/logo_box_mars.dart';
import '../widgets/myformfield.dart';
import 'main/cart_screen.dart';

class DetlailsScreen extends StatefulWidget {
  const DetlailsScreen({
    super.key,
    required this.productImages,
    required this.descriptionProdact,
    required this.titelProcat,
    required this.productId,
    required this.price,
    required this.detlailsText,
    required this.isBookmarked,
    required this.productSized,
  });
  final List<String> productImages;
  final List<String> productSized;
  final String descriptionProdact;
  final String productId;
  final String titelProcat;
  final String price;
  final String detlailsText;
  final bool isBookmarked;

  @override
  State<DetlailsScreen> createState() => _DetlailsScreenState();
}

class _DetlailsScreenState extends State<DetlailsScreen> {
  int currentImageIndex = 0;
  String pickedSize = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                DetlailsProdictImage(
                  onChanged: (p0) {
                    setState(() {
                      currentImageIndex = p0;
                    });
                  },
                  prodictImage: widget.productImages,
                ),
                SizedBox(
                  height: SizeApp.screenHeight! * 0.60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetlailsIcon(
                            onPressed: () => Navigator.pop(context),
                            svgIcon: iconApp.angleLeftIcon,
                          ),
                          DetlailsIcon(
                            isBookmarked: widget.isBookmarked,
                            onPressed: () {
                              BlocProvider.of<ProductsCubit>(context)
                                  .bookMarkProduct(productId: widget.productId);
                              detlailsFunctions.bookMark(context);
                              Future.delayed(Durations.extralong4, () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            },
                            svgIcon: iconApp.bookMarkIcon,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              widget.productImages.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: IndecatorBabelPackge(
                                  isActive: index == currentImageIndex,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListProdectTiel(
              descriptionProdact: widget.descriptionProdact,
              titelProcat: widget.titelProcat,
              price: widget.price,
            ),
            ProdactDetlailsText(detlailsText: widget.detlailsText),
            ShoppingButton(addToCar: () async {
              await showCupertinoDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => Dialog(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: ColorApp.backgroundColor,
                          borderRadius: BorderRadius.circular(
                              SizeApp.radiusSize as double),
                        ),
                        child: Column(
                          children: [
                            DropdownButtonFormField(
                              hint: Text(
                                "choose_size".tr(context),
                                style: styleTextDescription(),
                              ),
                              items: [
                                ...List.generate(
                                  widget.productSized.length,
                                  (index) => DropdownMenuItem(
                                    value: widget.productSized[index],
                                    child: Text(
                                      '${"size".tr(context)}: ${widget.productSized[index]}',
                                      style: styleTextDescription(),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                pickedSize = value!;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            IconButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: WidgetStatePropertyAll(
                                        ColorApp.primerColor)),
                                onPressed: () {
                                  if (pickedSize.isNotEmpty) {
                                    Navigator.pop(context);
                                    BlocProvider.of<CartCubit>(context)
                                        .addToCart(
                                            productSize: pickedSize,
                                            productId: widget.productId);
                                    detlailsFunctions.addToCar(context);
                                  }
                                },
                                icon: Text(
                                  'Okay',
                                  style: styleTextDescription(),
                                ))
                          ],
                        ))),
              );
            }, shoopingPrees: () async {
              final formKey = GlobalKey<FormState>();
              BlocProvider.of<CartCubit>(context).addressCont.text =
                  localUserData.userinfo!.userAddress!;
              BlocProvider.of<CartCubit>(context).phoneCont.text =
                  localUserData.userinfo!.phone!;
              await showCupertinoDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => Dialog(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: ColorApp.backgroundColor,
                          borderRadius: BorderRadius.circular(
                              SizeApp.radiusSize as double),
                        ),
                        child: Column(
                          children: [
                            DropdownButtonFormField(
                              hint: Text(
                                "choose_size".tr(context),
                                style: styleTextDescription(),
                              ),
                              items: [
                                ...List.generate(
                                  widget.productSized.length,
                                  (index) => DropdownMenuItem(
                                    value: widget.productSized[index],
                                    child: Text(
                                      '${"size".tr(context)}: ${widget.productSized[index]}',
                                      style: styleTextDescription(),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                pickedSize = value!;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            IconButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: WidgetStatePropertyAll(
                                        ColorApp.primerColor)),
                                onPressed: () {
                                  if (pickedSize.isNotEmpty) {
                                    Navigator.pop(context);
                                  }
                                },
                                icon: Text(
                                  'Okay',
                                  style: styleTextDescription(),
                                ))
                          ],
                        ))),
              );

              await showModalBottomSheet(
                  isDismissible: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorApp.primerColor, width: 7.5)),
                        padding: EdgeInsets.only(
                            top: 5,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                  controller:
                                      BlocProvider.of<CartCubit>(context)
                                          .phoneCont,
                                  hintTextMsg: 'hint_phone',
                                  keyboardType: TextInputType.number),
                              MyFormField(
                                  icon: CupertinoIcons.location_solid,
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return '*Empty';
                                    }
                                    if (s.length < 5) {
                                      return '*Invalid';
                                    }
                                    return null;
                                  },
                                  controller:
                                      BlocProvider.of<CartCubit>(context)
                                          .addressCont,
                                  hintTextMsg: 'hint_address',
                                  keyboardType: TextInputType.multiline),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${"total_price_msg".tr(context)}: ${(int.parse(widget.price) + 80).toStringAsFixed(2)} ${"currency".tr(context)}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorApp.erorrColor)),
                                  HeroButton(
                                    text: "buy_now_orders_msg",
                                    svgIcon: "",
                                    isBorder: false,
                                    isIcon: false,
                                    widthSize: SizeApp.screenWidth! / 3,
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Center(
                                child: Text("hint_order".tr(context),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.hintColor)),
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

                await BlocProvider.of<CartCubit>(context).createOrder(
                    orderItems: [
                      CartItem(
                          userid: localUserData.userinfo!.id,
                          productSize: pickedSize,
                          quantity: '1',
                          productprice: widget.price,
                          productid: widget.productId,
                          productname: widget.titelProcat)
                    ],
                    context: context,
                    totalQuantity: '1',
                    totalPrice:
                        (int.parse(widget.price) + 80).toStringAsFixed(2));
                Navigator.pop(context);

                detlailsFunctions.shopping(context);
              }
            })
          ],
        ),
      ),
    );
  }
}
