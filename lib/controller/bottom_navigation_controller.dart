import 'package:flutter/material.dart';
import 'package:money_saver/view/category_screen/category_screen.dart';
import 'package:money_saver/view/home_screen/home_screen.dart';
import 'package:money_saver/view/settings_screen/settings_screen.dart';

class BottomNavigationController extends ChangeNotifier {
  int selectedIndex = 0;
  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const SettingsScreen()
  ];
}
