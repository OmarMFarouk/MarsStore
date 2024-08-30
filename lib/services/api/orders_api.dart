import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/src/app_endpoints.dart';

class OrdersApi {
  Future fetchOrders() async {
    var request = await http.post(Uri.parse(AppEndPoints.showOrders),
        body: {'credential': localUserData.userinfo!.email});
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future createOrder(
      {required List orderItems,
      required String userPhone,
      required String totalPrice,
      required String totalQuantity,
      required String userLocation,
      required String userAddress}) async {
    var request = await http.post(Uri.parse(AppEndPoints.createOrder), body: {
      'order_items': jsonEncode(orderItems),
      'total_price': totalPrice,
      'total_quantity': totalQuantity,
      'user_address': userAddress,
      'user_location': userLocation,
      'user_phone': userPhone,
      'user_email': localUserData.userinfo!.email
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }
}
