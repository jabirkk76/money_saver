import 'package:flutter/material.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_text_styles.dart';

class MoneyStatusWidget extends StatelessWidget {
  const MoneyStatusWidget(
      {super.key,
      required this.status,
      required this.icon,
      required this.color});
  final String status;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(status, style: AppTextStyles.whiteTextSize20),
        Text(AppLocalization.of(context)!.translate(status),
            style: AppTextStyles.whiteTextSize20),
        Icon(
          icon,
          color: color,
        ),
      ],
    );
  }
}
