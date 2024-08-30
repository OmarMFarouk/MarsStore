import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/src/app_endpoints.dart';

class ProductsApi {
  Future fetchProducts() async {
    var request = await http.post(Uri.parse(AppEndPoints.showProducts),
        body: {'user_id': localUserData.userinfo!.id});
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future bookMarkProduct({required String productId}) async {
    var request = await http.post(Uri.parse(AppEndPoints.bookMarkProduct),
        body: {'product_id': productId, 'user_id': localUserData.userinfo!.id});
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }
}
