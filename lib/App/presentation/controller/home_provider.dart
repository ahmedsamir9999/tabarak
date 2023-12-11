import 'package:flutter/cupertino.dart';
import 'package:quran/quran.dart' as quran;
import '../screens/azan_screen.dart';
import '../screens/quran_screen.dart';
import '../screens/saved_screen.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  final pageController = PageController();

  List<Widget> screens = [
     QuranScreen(),
    const AzanScreen(),
    const SavedScreen(),
  ];

  changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  changePage(page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
  List suraList=[];
  List showList=[];
  saveList(){
    for(int i=0;i<113;i++){
      suraList.add(quran.getSurahName(i+1));
    }
    print(suraList);
    notifyListeners();
  }

  String ttt="z";
  test(value){
    if(value.isNotEmpty)
    {
      showList=suraList.where((element) => element.contains(value),).toList();
      if(showList.isEmpty){ttt="not found";}
      else{
        ttt=showList[0];
      }
      print(showList);

    }
    else{
      showList=suraList;
      print(showList);
      ttt="empty";

  }
    notifyListeners();
}}
