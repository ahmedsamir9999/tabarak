import 'package:flutter/cupertino.dart';

import '../screens/azan_screen.dart';
import '../screens/quran_screen.dart';
import '../screens/saved_screen.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  final pageController = PageController();

  List<Widget> screens = [
    QuranScreen(),
    AzanScreen(),
    SavedScreen(),
  ];

  changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  changePage(page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
}
