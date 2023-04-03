import 'package:flutter/material.dart';
import 'package:money_saver/model/page_view_model.dart';
import 'package:money_saver/widget/bottom_navigation_bar_widget.dart';

class OnBoardController extends ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController();
  List<ImageModel> images = [
    ImageModel(image: 'assets/giphy.gif'),
    ImageModel(image: 'assets/images.jpg'),
    ImageModel(image: 'assets/pexels-photo-3943745.jpeg'),
  ];
  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void navigateToBottomnavWidget(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BottomNavigationWidget(),
      ),
    );
  }
}
