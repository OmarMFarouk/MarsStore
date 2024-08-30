import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/home_screen/indecatorads_bloc.dart';
import 'package:mars/bloc/products_bloc/products_cubit.dart';
import 'package:mars/bloc/products_bloc/products_states.dart';
import 'package:mars/components/info_ads_banner.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/costom_viow_prodact.dart';
import 'package:mars/custom/custom_search_bar.dart';
import 'package:mars/widgets/divider_prdact_text.dart';

import '../../models/products_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> searchResult = [];
  @override
  void initState() {
    filterProducts(
        BlocProvider.of<ProductsCubit>(context).productsModel.products);
    super.initState();
  }

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
    return BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (context, state) {
      if (state is ProductsSuccess) {
        filterProducts(ProductsCubit.get(context).productsModel.products);
      }
    }, builder: (context, state) {
      var cubit = ProductsCubit.get(context);
      return Scaffold(
        backgroundColor: ColorApp.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom search bar
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                  height: 35.h,
                  child: CustomSearchBar(
                    onTap: () {
                      setState(() {
                        filterProducts(cubit.productsModel.products!);
                      });
                    },
                    onChanged: (p0) {
                      setState(() {
                        getMatch(
                            productsList: cubit.productsModel.products,
                            query: p0);
                      });
                    },
                  )),
            ),

            Expanded(
              child: SizedBox(
                height: SizeApp.screenHeight! * 1 - 182.h,
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      // ads panner
                      BlocProvider(
                        create: (context) => IndecatoradsBloc(),
                        child: const AdsBanner(),
                      ),
                      DividerProdctText(
                        textDevider: filterValue,
                      ),
                      // viow prodictes

                      searchResult.isEmpty
                          ? CustomViewProdicts(productsList: filteredList)
                          : CustomViewProdicts(productsList: searchResult),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

List<Product>? filteredList = [];
filterProducts(List<Product>? productsList) {
  if (filterValue == "divider_all_procuct_msg") {
    filteredList = productsList;
    filteredList!.sort((a, b) => int.parse(a.id!).compareTo(int.parse(b.id!)));
  } else if (filterValue == "divider_most_sold_msg") {
    filteredList = productsList;
    filteredList!.sort((a, b) =>
        int.parse(b.bookmarkCount!).compareTo(int.parse(a.bookmarkCount!)));
  } else if (filterValue == "divider_highest_price_msg") {
    filteredList = productsList;
    filteredList!.sort((a, b) =>
        int.parse(b.productprice!).compareTo(int.parse(a.productprice!)));
  } else if (filterValue == "divider_lowest_price_msg") {
    filteredList = productsList;
    filteredList!.sort((a, b) =>
        int.parse(a.productprice!).compareTo(int.parse(b.productprice!)));
  }
}
