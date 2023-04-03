import 'package:flutter/material.dart';
import 'package:money_saver/controller/onboard_controller.dart';
import 'package:money_saver/helpers/app_colors.dart';
import 'package:money_saver/helpers/app_localization.dart';
import 'package:money_saver/widget/localization_widget.dart';
import 'package:provider/provider.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardController>(
        builder: (context, value, child) => Stack(
          children: [
            PageView.builder(
              controller: value.pageController,
              onPageChanged: (int index) {
                value.changeIndex(index);
              },
              itemCount: value.images.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(value.images[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 250,
                  ),
                );
              },
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    if (value.currentIndex == value.images.length - 1) {
                      value.navigateToBottomnavWidget(context);
                    } else {
                      value.pageController.jumpToPage(2);
                    }
                  },
                  child: Text(
                    value.currentIndex == value.images.length - 1
                        ? AppLocalization.of(context)!.translate('Continue')
                        : AppLocalization.of(context)!.translate('Skip'),
                  ),
                ),
              ),
            ),
            const LocalizationWidget()
          ],
        ),
      ),
    );
  }
}
