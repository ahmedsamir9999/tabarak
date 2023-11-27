import 'package:flutter/material.dart';

import 'App/presentation/screens/home.dart';
import 'App/presentation/screens/page_of_elmoshaf.dart';
import 'core/shared preferences/shared.dart';


void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Home(),
      //  home: PageOfElmoshaf(sura: 30),
      //home: ItemForeVerse(index: 0,numOfSurah: 18),

    );
  }
}
