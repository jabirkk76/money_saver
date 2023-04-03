// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/view/add_transactions_screen/add_transactions_screen.dart';

class SearchController extends ChangeNotifier {
  void navigateToAddTransactions(
      {required BuildContext context,
      TransactionModel? transactionModel,
      int? index,
      required TwoScreens twoScreens}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTransactionsScreen(
          twoScreens: twoScreens,
          transactionModel: transactionModel,
          index: index,
        ),
      ),
    );
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
