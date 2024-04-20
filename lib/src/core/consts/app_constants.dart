import 'package:flutter/material.dart'
    show Locale, LocalizationsDelegate, MaterialLocalizations;

class AppConsts {
  static const String appName = 'Vendor App';
  static const int vendorId = 1;
  static const String appFont = 'ProductSans';
  static const String cart = 'cart';
  static const String currency = '\$';
  static const Locale locale = Locale('ar');
  static const enLocale = Locale('en');

  static const List<Locale> supportedLocales = [
    locale,
  ];

  static const int slideAnimatedDuration = 1200;
}
