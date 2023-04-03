import 'package:flutter/material.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/helpers/app_text_styles.dart';
import 'package:money_saver/view/category_screen/widget/add_expense_widget.dart';
import 'package:money_saver/view/category_screen/widget/add_income_widget.dart';
import 'package:money_saver/view/category_screen/widget/floating_action_button_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalization.of(context)!.translate('Category'),
          style: AppTextStyles.whiteTextSize25,
        ),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: AppColors.white),
              child: TabBar(
                tabs: [
                  Tab(
                    text: AppLocalization.of(context)!.translate('Income'),
                  ),
                  Tab(
                    text: AppLocalization.of(context)!.translate('Expense'),
                  ),
                ],
                controller: tabController,
                unselectedLabelColor: AppColors.unSelectedTabColor,
                labelColor: AppColors.selectedTabColor,
                dividerColor: Colors.amber,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  AddIncomeWidget(),
                  AddExpenseWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButtonWidget(tabController: tabController),
    );
  }
}
