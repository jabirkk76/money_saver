import 'package:flutter/material.dart';
import 'package:money_saver/controller/splash_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    splashController.navigateToOnboard(context);
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
