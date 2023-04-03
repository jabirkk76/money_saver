// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_saver/controller/home_controller.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/view/add_transactions_screen/add_transactions_screen.dart';
import 'package:money_saver/view/home_screen/widget/card_widget.dart';
import 'package:money_saver/view/search_screen/search_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);
    final homeController = Provider.of<HomeController>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.primaryGreyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTransactionsScreen(
                    twoScreens: TwoScreens.add,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizes.szdBxH20,
              const CardWidget(),
              AppSizes.szdBxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppLocalization.of(context)!
                        .translate('Recent Transactions'),
                    style: AppTextStyles.textsize25,
                  ),
                  TextButton(
                    onPressed: () {
                      homeController.navigateToAllTransactionsScreen(context);
                    },
                    child: Text(
                      AppLocalization.of(context)!.translate('View All'),
                    ),
                  ),
                ],
              ),
              AppSizes.szdBxH20,
              Expanded(
                child: Consumer<TransactionController>(
                    builder: (context, value, child) {
                  if (value.transactionList.isEmpty) {
                    return Center(
                      child: Text(
                        AppLocalization.of(context)!
                            .translate('No transaction added'),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.transactionList.length >= 4
                            ? 4
                            : value.transactionList.length,
                        itemBuilder: (context, index) {
                          final transaction = value.transactionList[index];
                          return SizedBox(
                            height: 80,
                            child: Slidable(
                              startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: SizedBox(
                                              height: 150,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    'Are you sure you want to delete this item ?',
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () async {
                                                            value
                                                                .deleteTransaction(
                                                                    index);

                                                            homeController
                                                                .navigateBack(
                                                                    context);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                content: Center(
                                                                  child: Text(
                                                                    AppLocalization.of(
                                                                            context)!
                                                                        .translate(
                                                                            'Transaction deleted successfully'),
                                                                    style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: const Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .green,
                                                                fontSize: 14),
                                                          )),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color:
                                                                  AppColors.red,
                                                              fontSize: 14),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icons.delete,
                                      foregroundColor: AppColors.red,
                                      label: 'Delete',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: SizedBox(
                                              height: 150,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    'Are you sure you want to edit this item ?',
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () async {
                                                            homeController
                                                                .navigateToAddTransactions(
                                                              context: context,
                                                              transactionModel:
                                                                  value.transactionList[
                                                                      index],
                                                              index: index,
                                                              twoScreens:
                                                                  TwoScreens
                                                                      .edit,
                                                            );
                                                          },
                                                          child: const Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .green,
                                                                fontSize: 14),
                                                          )),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color:
                                                                  AppColors.red,
                                                              fontSize: 14),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icons.edit,
                                      foregroundColor: AppColors.green,
                                      label: 'Edit',
                                    ),
                                  ]),
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      value.transactionList[index].category
                                                  .type ==
                                              CategoryType.income
                                          ? const Icon(
                                              Icons.arrow_circle_up_outlined,
                                              color: Colors.green,
                                            )
                                          : const Icon(
                                              Icons.arrow_circle_down_outlined,
                                              color: Colors.red,
                                            ),
                                      Text(value.transactionList[index].category
                                          .name),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(value
                                        .transactionList[index].description),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '₹ ${value.transactionList[index].amount.floor().toString()}'),
                                      Text(parseDate(
                                          value.transactionList[index].date)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }
}
