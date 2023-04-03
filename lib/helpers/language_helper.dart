import 'package:flutter/material.dart';

class LanguageHelper {
  nameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = const Locale('en', 'EN');
        break;
      case 'Urdu':
        convertedLocale = const Locale('ur', 'Ur');
        break;
      case 'Hindi':
        convertedLocale = const Locale('hi', 'HI');
        break;

      case 'Gujarathi':
        convertedLocale = const Locale('gu', 'GU');
        break;
      default:
        convertedLocale = const Locale('en', 'EN');
    }

    return convertedLocale;
  }

  localeToName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;

      case 'hi':
        langName = "Hindi";
        break;

      case 'gu':
        langName = "Gujarathi";
        break;
      default:
        langName = "Malayalam";
    }

    return langName;
  }
}
