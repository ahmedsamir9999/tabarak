import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'App/presentation/controller/home_provider.dart';
import 'App/presentation/controller/quran_provider.dart';
import 'App/presentation/screens/home.dart';
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

    return  MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=> HomeProvider(),),
          ChangeNotifierProvider(create: (context)=> QuranProvider(),),
        ] ,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        //  home: PageOfElmoshaf(sura: 30),
        //home: ItemForeVerse(index: 0,numOfSurah: 18),

      ),
    );
  }
}
