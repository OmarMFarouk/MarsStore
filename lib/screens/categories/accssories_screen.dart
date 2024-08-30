import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/costom_viow_prodact.dart';
import 'package:mars/custom/custom_app_bar.dart';
import 'package:mars/custom/custom_search_bar.dart';
import '../../bloc/products_bloc/products_cubit.dart';
import '../../models/products_model.dart';
import '../main/home_screen.dart';

class AccssoriesScreen extends StatefulWidget {
  const AccssoriesScreen({super.key});

  @override
  State<AccssoriesScreen> createState() => _AccssoriesScreenState();
}

class _AccssoriesScreenState extends State<AccssoriesScreen> {
  List<Product> searchResult = [];

  void getMatch({productsList, query}) {
    searchResult.clear();
    for (Product item in productsList) {
      if (item.productname!.toLowerCase().contains(query.toLowerCase()) &&
          !searchResult.contains(item)) {
        setState(() => searchResult.add(item));
      }
      if (query == "") {
        setState(() {
          searchResult.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(titelScreen: "accessories_ads_msg".tr(context)),
          // custom search bar
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
                height: 35.h,
                child: CustomSearchBar(
                  onTap: () {
                    setState(() {
                      filterProducts(
                          ProductsCubit.get(context).productsModel.products!);
                    });
                  },
                  onChanged: (p0) {
                    getMatch(
                        productsList:
                            ProductsCubit.get(context).productsModel.products,
                        query: p0);
                  },
                )),
          ),
          Expanded(
            child: SizedBox(
              height: SizeApp.screenHeight! * 1 - 125.h,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    searchResult.isEmpty
                        ? CustomViewProdicts(
                            productsList: categoryFiltering(
                                ProductsCubit.get(context)
                                    .productsModel
                                    .products),
                          )
                        : CustomViewProdicts(
                            productsList: categoryFiltering(searchResult),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Product?>? categoryFiltering(List<Product?>? productList) {
    List<Product> filtered = [];
    for (var i = 0; i < productList!.length; i++) {
      if (productList[i]!.productCategory == 'accessories') {
        filtered.add(productList[i]!);
      }
    }
    return filtered;
  }
}
