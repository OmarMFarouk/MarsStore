import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:mars/src/app_shared.dart';
import 'package:android_id/android_id.dart';

import '../../src/app_endpoints.dart';

class AuthApi {
  final _androidIdPlugin = const AndroidId();
  final String _chars = '1234567890';
  final Random _rnd = Random();

  String referCodeGenerator(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future loginUser(
      {required String credential, required String password}) async {
    var request = await http.post(Uri.parse(AppEndPoints.loginUser), body: {
      'credential': credential,
      'password': password,
      'fcm_token': AppShared.localStorage.getString('token') ?? 'device error'
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }

  Future registerUser(
      {required String email,
      required String phone,
      required String userName,
      required String password}) async {
    final String otpCode = referCodeGenerator(4);
    final String? androidId = await _androidIdPlugin.getId();
    var request = await http.post(Uri.parse(AppEndPoints.registerUser), body: {
      'email': email,
      'password': password,
      'username': userName,
      'phone': phone,
      'device_id': androidId,
      'fcm_token': AppShared.localStorage.getString('token') ?? 'device error',
      'otp': otpCode
    });
    if (request.statusCode < 300) {
      recentOtpCode = otpCode;
      var response = jsonDecode(request.body);
      return response;
    } else {
      return null;
    }
  }
}

String recentOtpCode = '';
