import 'package:flutter/material.dart';
import 'package:money_saver/controller/bottom_navigation_controller.dart';
import 'package:money_saver/db/category/category_db.dart';
import 'package:money_saver/model/category_model/category_model.dart';
import 'package:money_saver/widget/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class CategoryController extends ChangeNotifier {
  CategoryController() {
    getAllData();
  }
  bool isLoading = false;
  List<CategoryModel> incomeCategoryList = [];
  List<CategoryModel> expenseCategoryList = [];
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController expenseController = TextEditingController();
  CategoryModel? categoryModel;
  CategoryType? categoryType;

  void navigateToHomeScreen(
    BuildContext context,
  ) {
    final bottomNavigationController =
        Provider.of<BottomNavigationController>(context, listen: false);
    bottomNavigationController.selectedIndex = 0;
    Navigator.of(
      context,
    ).push(MaterialPageRoute(
      builder: (
        context,
      ) =>
          const BottomNavigationWidget(),
    ));
  }

  void clearTextFormField() {
    incomeController.clear();
    expenseController.clear();

    notifyListeners();
  }

  void insertCategory(CategoryModel model) async {
    await CategoryDataBaseFunctions().insertData(model);
    getAllData();
  }

  void getAllData() async {
    isLoading = true;
    notifyListeners();
    final allCategories = await CategoryDataBaseFunctions().getAllData();
    isLoading = false;
    notifyListeners();
    incomeCategoryList.clear();
    expenseCategoryList.clear();
    await Future.forEach(
      allCategories,
      (element) {
        if (element.type == CategoryType.income) {
          incomeCategoryList.add(element);
        } else {
          expenseCategoryList.add(element);
        }
      },
    );
    notifyListeners();
  }

  void deleteCategory(int index) async {
    await CategoryDataBaseFunctions().delete(index);
    notifyListeners();
  }
}
