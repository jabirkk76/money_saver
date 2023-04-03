// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/view/add_transactions_screen/add_transactions_screen.dart';
import 'package:money_saver/view/home_screen/home_screen.dart';

class AddTransactionsController extends ChangeNotifier {
  CategoryType userSelectedCategoryType = CategoryType.income;
  CategoryModel? categoryModel;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String? dropdownValue;

  String dropdownHint = 'Select category';

  String parseDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  void incomeRadio() {
    userSelectedCategoryType = CategoryType.income;
    dropdownValue = null;
    notifyListeners();
  }

  void expenseRadio() {
    userSelectedCategoryType = CategoryType.expense;
    dropdownValue = null;
    notifyListeners();
  }

  DateTime? selectedDate;

  void changeDate(DateTime? selectedDateTemp) {
    selectedDate = selectedDateTemp;
    notifyListeners();
  }

  void changeCategory(CategoryModel e) {
    categoryModel = e;
    notifyListeners();
  }

  void screenCheck(TwoScreens twoScreens, TransactionModel model) {
    if (twoScreens == TwoScreens.edit) {
      amountController.text = model.amount.toString();
      descriptionController.text = model.description;
      selectedDate = model.date;
      dropdownHint = model.category.name;
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
