// ignore_for_file: unused_local_variable, avoid_print, avoid_returning_null_for_void, unrelated_type_equality_checks

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_saver/controller/add_transaction_controller.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';
import 'package:money_saver/widget/text_form_field_widget.dart';
import 'package:provider/provider.dart';

enum TwoScreens {
  add,
  edit,
}

class AddTransactionsScreen extends StatelessWidget {
  const AddTransactionsScreen({
    super.key,
    required this.twoScreens,
    this.transactionModel,
    this.index,
  });
  final TwoScreens twoScreens;
  final TransactionModel? transactionModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final addTransactionController =
        Provider.of<AddTransactionsController>(context, listen: false);
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);

    final formkey = GlobalKey<FormState>();

    if (twoScreens == TwoScreens.edit) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        addTransactionController.screenCheck(twoScreens, transactionModel!);
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: twoScreens == TwoScreens.add
            ? Text(
                AppLocalization.of(context)!.translate('Add Transactions'),
              )
            : Text(AppLocalization.of(context)!.translate('Edit Transactions')),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(
            builder: (context, value, child) => Form(
              key: formkey,
              child: Consumer<AddTransactionsController>(
                builder: (context, value, child) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              fillColor: MaterialStateProperty.all(
                                  AppColors.primaryColor),
                              value: CategoryType.income,
                              groupValue: addTransactionController
                                  .userSelectedCategoryType,
                              onChanged: (values) {
                                value.incomeRadio();
                              },
                            ),
                            Text(
                              AppLocalization.of(context)!.translate('Income'),
                              style: AppTextStyles.textsize20,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              fillColor: MaterialStateProperty.all(
                                  AppColors.primaryColor),
                              value: CategoryType.expense,
                              groupValue: addTransactionController
                                  .userSelectedCategoryType,
                              onChanged: (values) {
                                value.expenseRadio();
                              },
                            ),
                            Text(
                              AppLocalization.of(context)!.translate('Expense'),
                              style: AppTextStyles.textsize20,
                            )
                          ],
                        ),
                      ],
                    ),
                    AppSizes.szdBxH20,
                    Consumer2<AddTransactionsController, CategoryController>(
                      builder: (context, value1, value2, child) {
                        return DropdownButtonFormField(
                          hint: Text(addTransactionController.dropdownHint),
                          value: addTransactionController.dropdownValue,
                          items: value.userSelectedCategoryType ==
                                  CategoryType.income
                              ? value2.incomeCategoryList.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name),
                                      onTap: () {
                                        value.changeCategory(e);
                                      },
                                    );
                                  },
                                ).toList()
                              : value2.expenseCategoryList.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name),
                                      onTap: () {
                                        value.changeCategory(e);
                                      },
                                    );
                                  },
                                ).toList(),
                          onChanged: (newValue) {
                            value.dropdownValue = newValue;
                          },
                        );
                      },
                    ),
                    AppSizes.szdBxH20,
                    TextFormFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter valid description';
                        } else {
                          return null;
                        }
                      },
                      controller: value.descriptionController,
                      hint:
                          AppLocalization.of(context)!.translate('Description'),
                      keyBoard: TextInputType.text,
                    ),
                    AppSizes.szdBxH20,
                    TextFormFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter an amount';
                        } else {
                          return null;
                        }
                      },
                      controller: value.amountController,
                      hint: AppLocalization.of(context)!
                          .translate('Enter Amount'),
                      keyBoard: TextInputType.number,
                    ),
                    AppSizes.szdBxH20,
                    SizedBox(
                      height: 60,
                      width: 330,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          onPressed: () async {
                            final selectedDateTemp = await showDatePicker(
                                builder: (context, child) => Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                          primary: AppColors.primaryColor),
                                      cardColor: AppColors.primaryColor,
                                    ),
                                    child: child!),
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 100)),
                                lastDate: DateTime.now());
                            if (selectedDateTemp == null) {
                              return null;
                            } else {
                              value.changeDate(selectedDateTemp);
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: AppColors.white,
                          ),
                          label: Text(
                            value.selectedDate == null
                                ? AppLocalization.of(context)!
                                    .translate('Select Date')
                                : value.parseDate(value.selectedDate!),
                            style: const TextStyle(color: AppColors.white),
                          )),
                    ),
                    AppSizes.szdBxH20,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          if (twoScreens == TwoScreens.add) {
                            addTransaction(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Center(
                                child: Text(
                                  AppLocalization.of(context)!.translate(
                                      'Transaction added successfully'),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ));
                          } else {
                            editTransaction(
                              context,
                              index!,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.green,
                              content: Center(
                                child: Text(
                                  'Transaction edited successfully',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ));
                          }
                          transactionController.getAllData();

                          addTransactionController.navigateToHome(context);
                        },
                        child: twoScreens == TwoScreens.add
                            ? Text(
                                AppLocalization.of(context)!.translate('Add'))
                            : Text(
                                AppLocalization.of(context)!.translate('Edit')))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addTransaction(BuildContext context) {
    final addTransactionController =
        Provider.of<AddTransactionsController>(context, listen: false);
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);

    if (addTransactionController.selectedDate == null ||
        addTransactionController.categoryModel == null) {
      log('message');
      return;
    }
    final addModel = TransactionModel(
      category: addTransactionController.categoryModel!,
      type: addTransactionController.userSelectedCategoryType,
      description: addTransactionController.descriptionController.text,
      amount: double.parse(addTransactionController.amountController.text),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: addTransactionController.selectedDate!,
    );

    transactionController.addTransaction(addModel, context);
  }

  void editTransaction(BuildContext context, int index) {
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);
    final addTransactionController =
        Provider.of<AddTransactionsController>(context, listen: false);
    if (addTransactionController.selectedDate == null ||
        addTransactionController.categoryModel == null) {
      log('message');
      return;
    }
    final editModel = TransactionModel(
      category: addTransactionController.categoryModel!,
      type: addTransactionController.userSelectedCategoryType,
      description: addTransactionController.descriptionController.text,
      amount: double.parse(addTransactionController.amountController.text),
      id: transactionModel!.id,
      date: addTransactionController.selectedDate!,
    );

    transactionController.editTransaction(editModel, index);
  }
}
