import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc/cart_cubit.dart';
import '../bloc/products_bloc/products_cubit.dart';
import '../bloc/user_bloc/user_cubit.dart';

class RefreshAppFunctions {
  bool isRefresh = false;
  Future<void> onRefresh(BuildContext context) async {
    await Future.wait([
      initialUserDataFetching(context),
      initialCartFetching(context),
      initialProductsFetching(context)
    ]);
  }

  Future initialCartFetching(context) async {
    await BlocProvider.of<CartCubit>(context).fetchCartData();
  }

  Future initialProductsFetching(context) async {
    await BlocProvider.of<ProductsCubit>(context).fetchProducts();
  }

  Future initialUserDataFetching(context) async {
    await BlocProvider.of<UserCubit>(context).fetchUserData();
  }
}

RefreshAppFunctions refreshAppFunctions = RefreshAppFunctions();
