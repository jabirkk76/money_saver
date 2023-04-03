// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:money_saver/view/on_board_screen/on_board_screen.dart';

class SplashController extends ChangeNotifier {
  navigateToOnboard(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OnBoardScreen(),
      ),
    );
  }
}
