import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mars/core/localizations_app.dart';

class LocalizationFunction {
  Locale localizationFunction(Locale? d, Iterable<Locale> s) {
    for (var locale in s) {
      if (d != null && d.languageCode == locale.languageCode) {
        return d;
      }
    }

    return s.first;
  }

  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    LocalizationsApp.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];

  Iterable<Locale> supportedLocales = const [Locale('en'), Locale('ar')];
}

LocalizationFunction localizationFunction = LocalizationFunction();
