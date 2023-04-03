import 'package:flutter/material.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {super.key, required this.categoryIcon, required this.category});
  final Icon categoryIcon;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            categoryIcon,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                category,
                style: AppTextStyles.textsize20,
              ),
            ),
          ],
        ),
        AppSizes.szdBxH20
      ],
    );
  }
}
