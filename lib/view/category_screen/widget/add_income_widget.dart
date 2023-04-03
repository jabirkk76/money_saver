import 'package:flutter/material.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_sizes.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:provider/provider.dart';

class AddIncomeWidget extends StatelessWidget {
  const AddIncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController =
        Provider.of<CategoryController>(context, listen: false);
    return Consumer<CategoryController>(builder: (context, value, child) {
      if (value.incomeCategoryList.isEmpty) {
        return const Center(
          child: Text('No category added'),
        );
      }
      return ListView.separated(
        separatorBuilder: (context, index) => AppSizes.szdBxH10,
        itemCount: value.incomeCategoryList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              value.incomeCategoryList[index].name,
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
