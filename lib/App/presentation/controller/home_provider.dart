import 'package:flutter/cupertino.dart';

import '../screens/azan_screen.dart';
import '../screens/quran_screen.dart';
import '../screens/saved_screen.dart';

class HomeProvider extends ChangeNotifier
{
  int currentIndex = 0 ;

  List<Widget> screens = const[
    QuranScreen(),
    AzanScreen(),
    SavedScreen(),
  ];

  changeIndex(index)
  {
    currentIndex = index ;
    notifyListeners();
  }


}