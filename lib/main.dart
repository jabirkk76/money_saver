// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/controller/add_transaction_controller.dart';
import 'package:money_saver/controller/all_transactions_controller.dart';
import 'package:money_saver/controller/bottom_navigation_controller.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/controller/home_controller.dart';
import 'package:money_saver/controller/language_controller.dart';
import 'package:money_saver/controller/onboard_controller.dart';
import 'package:money_saver/controller/search_controller.dart';
import 'package:money_saver/controller/splash_controller.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/view/splash_screen/splash_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LanguageController currentData = LanguageController();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => currentData,
      child: Consumer<LanguageController>(
        builder: (context, value, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => currentData),
            ChangeNotifierProvider(
              create: (context) => SplashController(),
            ),
            ChangeNotifierProvider(
              create: (context) => TransactionController(),
            ),
            ChangeNotifierProvider(
              create: (context) => OnBoardController(),
            ),
            ChangeNotifierProvider(
              create: (context) => BottomNavigationController(),
            ),
            ChangeNotifierProvider(
              create: (context) => CategoryController(),
            ),
            ChangeNotifierProvider(
              create: (context) => AllTransactionsController(),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(),
            ),
            ChangeNotifierProvider(
              create: (context) => AddTransactionsController(),
            ),
            ChangeNotifierProvider(
              create: (context) => SearchController(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
            locale:
                Provider.of<LanguageController>(context).initialLanguageCode,
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [Locale('en'), Locale('hi'), Locale('gu')],
          ),
        ),
      ),
    );
  }
}
