import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/src/app_endpoints.dart';

class CartApi {
  Future fetchCart() async {
    var request = await http.post(Uri.parse(AppEndPoints.showCart),
        body: {'user_id': localUserData.userinfo!.id});
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future addToCart(
      {required String productId, required String productSize}) async {
    var request = await http.post(Uri.parse(AppEndPoints.addToCart), body: {
      'product_size': productSize,
      'product_id': productId,
      'user_id': localUserData.userinfo!.id
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future deleteCartItem(
      {required String productId, required String productSize}) async {
    var request =
        await http.post(Uri.parse(AppEndPoints.deleteCartItem), body: {
      'product_size': productSize,
      'product_id': productId,
      'user_id': localUserData.userinfo!.id
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future incrementCartItem(
      {required String productId,
      required String newQuantity,
      required String productSize}) async {
    var request =
        await http.post(Uri.parse(AppEndPoints.incrementCartItem), body: {
      'product_size': productSize,
      'product_id': productId,
      'user_id': localUserData.userinfo!.id,
      'new_quantity': newQuantity
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }
}
