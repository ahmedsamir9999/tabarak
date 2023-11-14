import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
import 'package:tabarak/core/utils/Style.dart';


import '../../../core/component/Card.dart';
import '../../../core/component/item_for_verse.dart';
import 'home.dart';

class PageOfElmoshaf extends StatelessWidget {
  int sura;
  int location ;

  PageOfElmoshaf({
    super.key,
    required this.sura,
     this.location=0,
  });

  final ItemScrollController scrollController = ItemScrollController();


  @override
  Widget build(BuildContext context) {
    Timer(Duration(microseconds: 1),
            () {
              scrollController.scrollTo(index: location, duration: Duration(seconds: 2));
            });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.mainColor.withOpacity(.6),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Home()));
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
        ),
        title: Center(
            child: Text(
          quran.getSurahNameArabic(sura),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
        actions: [
          IconButton(
            onPressed: ()
            {
              scrollController.scrollTo(index: 20-1, duration: Duration(seconds: 5));
            },
            icon: Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Caard(
              nameSura: "${quran.getSurahNameArabic(sura)}",
              verses: " ${quran.getVerseCount(sura)} : عدد الآيات ",
            sura: sura,
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemScrollController:scrollController,
              itemCount: quran.getVerseCount(sura),
              itemBuilder: (context, index) => ItemForeVerse(
                index: index,
                numOfSurah: sura,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
