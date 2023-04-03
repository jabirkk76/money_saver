import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_saver/controller/bottom_navigation_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationController>(
        builder: (context, value, child) => value.pages[value.selectedIndex],
      ),
      bottomNavigationBar: Consumer<BottomNavigationController>(
        builder: (context, value, child) => CurvedNavigationBar(
          height: 60,
          animationDuration: const Duration(milliseconds: 300),
          color: AppColors.primaryColor,
          backgroundColor: AppColors.primaryGreyColor,
          onTap: (values) {
            value.changeIndex(values);
          },
          items: const <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.category_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
