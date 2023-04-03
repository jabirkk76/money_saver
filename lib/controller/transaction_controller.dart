// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_saver/db/transactions/transactions_db.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/view/on_board_screen/on_board_screen.dart';
import 'package:money_saver/widget/bottom_navigation_bar_widget.dart';

class TransactionController with ChangeNotifier {
  TransactionController() {
    getAllData();
    print('object');
  }

  bool isLoading = false;
  double currentBalance = 0;
  double totalIncome = 0;
  double totalExpense = 0;

  List<TransactionModel> transactionList = [];
  void editTransaction(TransactionModel model, int index) async {
    await TransactionDataBaseFunctions().edit(index, model);
  }

  void deleteTransaction(int index) async {
    await TransactionDataBaseFunctions().delete(index);
    getAllData();
    notifyListeners();
  }

  void addTransaction(TransactionModel model, BuildContext context) async {
    await TransactionDataBaseFunctions().addTransaction(model).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavigationWidget(),
        ),
      );
    });
    getAllData();
  }

  void getAllData() async {
    isLoading = true;
    notifyListeners();
    transactionList = await TransactionDataBaseFunctions().getAllData();
    transactionList.sort(
      (first, second) => second.date.compareTo(first.date),
    );
    print(transactionList);
    totalIncome = 0;
    totalExpense = 0;
    currentBalance = 0;

    await Future.forEach(
      transactionList,
      (e) {
        if (e.type == CategoryType.income) {
          totalIncome = totalIncome + e.amount;
        } else {
          totalExpense = totalExpense + e.amount;
        }
        currentBalance = totalIncome - totalExpense;
      },
    );

    isLoading = false;
    notifyListeners();
  }

  deleteAllTransaction() async {
    await TransactionDataBaseFunctions().deleteAll();
    getAllData();
    notifyListeners();
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OnBoardScreen(),
      ),
    );
  }
}
