// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/widget/localization_widget.dart';
import 'package:money_saver/view/settings_screen/widget/settings_widget.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);
    final categoryController =
        Provider.of<CategoryController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalization.of(context)!.translate('Settings'),
          style: AppTextStyles.whiteTextSize25,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SettingsWidget(
              onTap: () async {
                await help();
              },
              categoryIcon: const Icon(Icons.help_outline_outlined),
              category: AppLocalization.of(context)!.translate('Help'),
            ),
            SettingsWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Are you sure you want to Reset this App ?',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      await categoryController
                                          .deleteAllCategories();
                                      await transactionController
                                          .deleteAllTransaction();

                                      transactionController
                                          .navigateToHome(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  'Your app is completely Reset')));
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: AppColors.green, fontSize: 14),
                                    )),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: AppColors.red, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              categoryIcon: const Icon(Icons.restore),
              category: AppLocalization.of(context)!.translate('Factory Reset'),
            ),
            SettingsWidget(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: SizedBox(
                      height: 250,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            AppSizes.szdBxH20,
                            Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle),
                                  height: 50,
                                  width: 50,
                                  child: const Center(
                                    child: Text(
                                      'MSave',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('MONEY SAVER'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(' v.1.0.0.1')
                              ],
                            ),
                            AppSizes.szdBxH20,
                            const Text(
                                'This is your go-to app for daily expenses.Designed for personal budgeting.This money management app helps you to stay on top of your budget,finances and bills.'),
                            AppSizes.szdBxH20,
                            Row(
                              children: const [
                                Text('DEVELOPED BY'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'JABIR K.K.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              categoryIcon: const Icon(Icons.info_outline),
              category: AppLocalization.of(context)!.translate('About'),
            ),
            SettingsWidget(
              onTap: () async {
                await Share.share('https://github.com/jabirkk76/money_saver');
              },
              categoryIcon: const Icon(Icons.share),
              category:
                  AppLocalization.of(context)!.translate('Invite a friend'),
            ),
            const LocalizationWidget(),
            const Spacer(),
            const Text('v.1.0.0.1'),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> help() async {
    try {
      await launchUrl(Uri.parse('mailto:jabirkk76@gmail.com'));
    } catch (e) {
      log(e.toString());
    }
  }
}
