// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:money_saver/helpers/language_helper.dart';

class LanguageController with ChangeNotifier {
  String InitialLanguage = 'English';
  List<String> languages = ['English', 'Hindi', 'Gujarathi'];

  Locale initialLanguageCode = const Locale('en');

  LanguageHelper languageHelper = LanguageHelper();

  void changeLanguage(newLanguage) {
    print(newLanguage);

    Locale convertedLanguage;

    InitialLanguage = newLanguage;
    notifyListeners();

    convertedLanguage = languageHelper.nameToLocale(newLanguage);
    initialLanguageCode = convertedLanguage;
    notifyListeners();
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    if (InitialLanguage != null) {
      definedCurrentLanguage = InitialLanguage;
    } else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper.localeToName(
        Localizations.localeOf(context).toString(),
      );
    }

    return definedCurrentLanguage;
  }
}
