import 'package:flutter/material.dart';
import 'package:tabarak/core/utils/responsive.dart';

import 'App/presentation/screens/Splash_view.dart';
import 'App/presentation/screens/home.dart';
import 'App/presentation/screens/page_of_elmoshaf.dart';
import 'App/presentation/screens/quran_screen.dart';
import 'core/component/item_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
       //home: PageOfElmoshaf(sura: 1),
      //home: ItemForeVerse(index: 0,numOfSurah: 18),
       home: ItemPlayer(),
    );
  }
}
