import 'package:flutter/material.dart';
import 'package:money_saver/controller/category_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/view/category_screen/widget/expense_dialog_box_widget.dart';
import 'package:money_saver/view/category_screen/widget/income_dialog_box_widget.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final categoryController =
        Provider.of<CategoryController>(context, listen: false);
    return FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          if (tabController.index == 0) {
            categoryController.clearTextFormField();
            showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: SizedBox(
                      height: 200,
                      child: IncomeDialogBoxWidget(),
                    ),
                  );
                });
          } else {
            categoryController.clearTextFormField();
            showDialog(
              context: context,
              builder: (context) => const Dialog(
                child: SizedBox(
                  height: 200,
                  child: ExpenseDialogBoxWidget(),
                ),
              ),
            );
          }
        });
  }
}
