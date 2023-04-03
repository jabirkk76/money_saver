import 'package:flutter/material.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/widget/localization_widget.dart';
import 'package:money_saver/view/settings_screen/widget/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              categoryIcon: const Icon(Icons.assessment),
              category: AppLocalization.of(context)!.translate('Stats'),
            ),
            SettingsWidget(
              categoryIcon: const Icon(Icons.help),
              category: AppLocalization.of(context)!.translate('Help'),
            ),
            SettingsWidget(
              categoryIcon: const Icon(Icons.restore),
              category: AppLocalization.of(context)!.translate('Factory Reset'),
            ),
            SettingsWidget(
              categoryIcon: const Icon(Icons.details_outlined),
              category: AppLocalization.of(context)!.translate('About'),
            ),
            SettingsWidget(
              categoryIcon: const Icon(Icons.share),
              category:
                  AppLocalization.of(context)!.translate('Invite a friend'),
            ),
            const LocalizationWidget(),
          ],
        ),
      ),
    );
  }
}
