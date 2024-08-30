import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mars/services/overrides.dart';
import 'package:mars/src/app_root.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mars/src/app_shared.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppShared.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppRoot());
}
