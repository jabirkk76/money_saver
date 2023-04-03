import 'package:flutter/material.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/view/all_transactions_screen/all_transactions_screen.dart';

import '../view/add_transactions_screen/add_transactions_screen.dart';

class HomeController extends ChangeNotifier {
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
    notifyListeners();
  }

  void navigateToAllTransactionsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AllTransactionsScreen(),
    ));
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
