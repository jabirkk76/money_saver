import 'package:flutter/material.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/view/home_screen/widget/money_status_widget.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<TransactionController>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const CircularProgressIndicator();
          }
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22))),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalization.of(context)!.translate('Current Balance'),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    value.currentBalance.floor().toString(),
                    style: AppTextStyles.whiteTextSize20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      MoneyStatusWidget(
                        color: AppColors.green,
                        icon: Icons.arrow_upward,
                        status: 'Income',
                      ),
                      MoneyStatusWidget(
                        color: AppColors.red,
                        icon: Icons.arrow_downward,
                        status: 'Expense',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        value.totalIncome.floor().toString(),
                        style: AppTextStyles.whiteTextSize20,
                      ),
                      Text(
                        value.totalExpense.floor().toString(),
                        style: AppTextStyles.whiteTextSize20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
