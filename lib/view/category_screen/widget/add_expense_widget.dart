import 'package:flutter/material.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:provider/provider.dart';

class AddExpenseWidget extends StatelessWidget {
  const AddExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController =
        Provider.of<CategoryController>(context, listen: false);
    return Consumer<CategoryController>(builder: (context, value, child) {
      return ListView.separated(
        separatorBuilder: (context, index) => AppSizes.szdBxH10,
        itemCount: value.expenseCategoryList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              value.expenseCategoryList[index].name,
              style: AppTextStyles.textsize20,
            ),
            trailing: IconButton(
              onPressed: () {
                categoryController.deleteCategory(index);
                categoryController.getAllData();
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.red,
              ),
            ),
          ),
        ),
      );
    });
  }
}
