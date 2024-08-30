import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/src/app_endpoints.dart';
import 'package:mars/src/app_shared.dart';

class UserApi {
  Future fetchUserData() async {
    var request = await http.post(Uri.parse(AppEndPoints.showUserData),
        body: {'credential': AppShared.localStorage.getString('credential')});
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future updateUserData({address, email, phone, path}) async {
    try {
      Map<String, String> data = {
        'user_id': localUserData.userinfo!.id!,
        'user_email': email,
        'user_phone': phone,
        'user_address': address
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppEndPoints.updateUserData),
      );
      request.fields.addAll(data);

      if (path.isNotEmpty) {
        var multipartFile = await http.MultipartFile.fromPath(
            'file', path); //returns a Future<MultipartFile>
        request.files.add(multipartFile);
      }

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = await jsonDecode(respStr);
      if (response.statusCode < 300) {
        return jsonData;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
