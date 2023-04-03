import 'package:flutter/material.dart';
import 'package:money_saver/controller/all_transactions_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/view/add_transactions_screen/add_transactions_screen.dart';
import 'package:money_saver/view/all_transactions_screen/widget/all_transaction_widget.dart';
import 'package:provider/provider.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allTransactionsController =
        Provider.of<AllTransactionsController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalization.of(context)!.translate('All Transactions'),
          style: AppTextStyles.whiteTextSize25,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: AllTransactionListWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          allTransactionsController.navigateToAddTransactions(
            context: context,
            twoScreens: TwoScreens.add,
          );
        },
      ),
    );
  }
}
