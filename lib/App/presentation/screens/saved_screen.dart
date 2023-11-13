import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
import 'package:tabarak/core/component/item_for_verse.dart';
import 'package:tabarak/core/utils/Style.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuranProvider(),
      child: Scaffold(
          body: Consumer<QuranProvider>(builder: (context, prov, child) {
         if(prov.saveCurrent == -1)
        {
          print(prov.saveCurrent);
          return Center(child: Text('dataaaxxxxxxa'));
        }else
        {
          return Center(
              child: ItemForeVerse(
                  index: 1, numOfSurah: 1)) ;
        }

      })),
    );
  }
}
