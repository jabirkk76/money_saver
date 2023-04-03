// ignore_for_file: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:provider/provider.dart';

class ExpenseDialogBoxWidget extends StatelessWidget {
  const ExpenseDialogBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController =
        Provider.of<CategoryController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Expense Category',
            style: AppTextStyles.textsize20,
          ),
          AppSizes.szdBxH20,
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: AppLocalization.of(context)!.translate('Category Name'),
            ),
            controller: categoryController.expenseController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  categoryController.navigateToHomeScreen(context);
                  categoryController.insertCategory(
                    CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: categoryController.expenseController.text,
                        type: CategoryType.expense),
                  );
                  print(
                    DateTime.now().millisecondsSinceEpoch.toString(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Center(
                        child: Text(
                          AppLocalization.of(context)!
                              .translate('Category created successfully'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Add',
                  style: AppTextStyles.textsize20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
