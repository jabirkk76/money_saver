// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_saver/controller/search_controller.dart';
import 'package:money_saver/controller/transaction_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/view/add_transactions_screen/add_transactions_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchController =
        Provider.of<SearchController>(context, listen: false);
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
          style: AppTextStyles.whiteTextSize25,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              onChanged: (values) {},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  hintText: 'Search....'),
            ),
          ),
          Consumer<TransactionController>(
            builder: (context, value, child) {
              if (value.transactionList.isEmpty) {
                return const Center(
                  child: Text(
                    'No transaction added',
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.transactionList.length,
                itemBuilder: (context, index) => SizedBox(
                  height: 80,
                  child: Slidable(
                    startActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: SizedBox(
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Are you sure you want to delete this item ?',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            transactionController
                                                .deleteTransaction(index);
                                            transactionController.getAllData();
                                            searchController
                                                .navigateBack(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Center(
                                                  child: Text(
                                                    'Transaction deleted successfully',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: AppColors.green,
                                                fontSize: 14),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: AppColors.red,
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
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Are you sure you want to edit this item ?',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              searchController
                                                  .navigateToAddTransactions(
                                                context: context,
                                                transactionModel: value
                                                    .transactionList[index],
                                                index: index,
                                                twoScreens: TwoScreens.edit,
                                              );
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 14),
                                            )),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: AppColors.red,
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
                        title: Text(value.transactionList[index].category.name),
                        trailing: Text(
                            '₹ ${value.transactionList[index].amount.floor().toString()}'),
                        subtitle: Text(
                          parseDate(value.transactionList[index].date),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String parseDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }
}
