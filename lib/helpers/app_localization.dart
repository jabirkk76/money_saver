// ignore_for_file: equal_keys_in_map

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Current Balance': 'Current Balance',
      'Skip': 'Skip',
      'Continue': 'Continue',
      'Category Name': 'Category Name',
      'Category created successfully': 'Category created successfully',
      'Transaction added successfully': 'Transaction added successfully',
      'Transaction edited successfully': 'Transaction edited successfully',
      'Transaction deleted successfully': 'Transaction deleted successfully',
      'Settings': 'Settings',
      'View All': 'View All',
      'Income': 'Income',
      'Expense': 'Expense',
      'Recent Transactions': 'Recent Transactions',
      'No transaction added': 'No transaction added',
      'Category': 'Category',
      'Settings': 'Settings',
      'Stats': 'Stats',
      'Help': 'Help',
      'Factory Reset': 'Factory Reset',
      'About': 'About',
      'Invite a friend': 'Invite a friend',
      'All Transactions': 'All Transactions',
      'Add Transactions': 'Add Transactions',
      'Description': 'Description',
      'Enter Amount': 'Enter Amount',
      'Select Date': 'Select Date',
      'Edit Transactions': 'Edit Transactions',
      'Add': 'Add',
      'Edit': 'Edit',
      'Select Category': 'Select Category'
    },
    'hi': {
      'Current Balance': 'वर्तमान शेष',
      'Skip': 'छोडना',
      'Continue': 'जारी रखना',
      'Category Name': 'श्रेणी नाम',
      'Category created successfully': 'श्रेणी सफलतापूर्वक बनाई गई',
      'Transaction edited successfully': 'लेन-देन सफलतापूर्वक संपादित किया गया',
      'Transaction added successfully': 'लेन-देन सफलतापूर्वक जोड़ा गया',
      'Transaction deleted successfully': 'लेन-देन सफलतापूर्वक हटा दिया गया',
      'View All': 'सभी को देखें',
      'Income': 'आय',
      'Expense': 'व्यय',
      'Recent Transactions': 'हाल ही के लेनदेन',
      'No transaction added': 'कोई लेन-देन नहीं जोड़ा गया',
      'Category': 'वर्ग',
      'Settings': 'समायोजन',
      'Stats': 'आँकड़े',
      'Help': 'मदद',
      'Factory Reset': 'नए यंत्र जैसी सेटिंग',
      'About': 'के बारे में',
      'Invite a friend': 'किसी मित्र को आमंत्रित करें',
      'All Transactions': 'सभी लेन - देन',
      'Add Transactions': 'लेनदेन जोड़ें',
      'Description': 'विवरण',
      'Enter Amount': 'राशि डालें',
      'Select Date': 'तारीख़ चुनें',
      'Edit Transactions': 'लेनदेन संपादित करें',
      'Add': 'जोड़ना',
      'Edit': 'संपादन करना',
      'Select Category': 'श्रेणी चुनना'
    },
    'gu': {
      'Current Balance': 'વર્તમાન રકમ',
      'Skip': 'અવગણો',
      'Continue': 'ચાલુ રાખો',
      'Category Name': 'શ્રેણી નામ',
      'Category created successfully': 'શ્રેણી સફળતાપૂર્વક બનાવવામાં આવી',
      'Transaction edited successfully': 'વ્યવહાર સફળતાપૂર્વક સંપાદિત થયો',
      'Transaction added successfully': 'વ્યવહાર સફળતાપૂર્વક ઉમેરાયો',
      'Transaction deleted successfully': 'વ્યવહાર સફળતાપૂર્વક કાઢી નાખ્યો',
      'View All': 'બધુજ જુઓ',
      'Income': 'આવક',
      'Expense': 'ખર્ચ',
      'Recent Transactions': 'તાજેતરના વ્યવહારો',
      'No transaction added': 'કોઈ વ્યવહાર ઉમેર્યો નથી',
      'Category': 'શ્રેણી',
      'Settings': 'સેટિંગ્સ',
      'Stats': 'આંકડા',
      'Help': 'મદદ',
      'Factory Reset': 'ફેક્ટરી રીસેટ',
      'About': 'વિશે',
      'Invite a friend': 'મિત્રને આમંત્રણ આપો',
      'All Transactions': 'તમામ વ્યવહારો',
      'Add Transactions': 'વ્યવહારો ઉમેરો',
      'Description': 'વર્ણન',
      'Enter Amount': 'રકમ દાખલ કરો',
      'Select Date': 'તારીખ પસંદ કરો',
      'Edit Transactions': 'વ્યવહારો સંપાદિત કરો',
      'Add': 'ઉમેરો',
      'Edit': 'ફેરફાર કરો',
      'Select Category': 'શ્રેણી પસંદ કરો'
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? '** $key not found';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ml', 'hi', 'ta', 'gu'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
