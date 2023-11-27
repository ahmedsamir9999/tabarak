import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  ScrollController controller = ScrollController() ;
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(microseconds: 1),
            () {
              scrollController.scrollTo(index: location, duration: const Duration(seconds: 2));
            });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.mainColor.withOpacity(.6),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Home()));
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: Center(
            child: Text(
          quran.getSurahNameArabic(sura),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        )),
        actions: [
          IconButton(
            onPressed: ()
            {

            },
            icon: const Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
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
              nameSura: quran.getSurahNameArabic(sura),
              verses: " ${quran.getVerseCount(sura)} : عدد الآيات ",
            sura: sura,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior:_ScrollbarBehavior() ,
              child: ScrollablePositionedList.builder(
                itemScrollController:scrollController,
                itemCount: quran.getVerseCount(sura),
                itemBuilder: (context, index) => ItemForeVerse(
                  index: index,
                  numOfSurah: sura,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return Scrollbar(
        controller: details.controller,
        interactive: true,
        thumbVisibility: true,
        thickness: 10,
        radius: Radius.circular(30),
        child: child);
  }
}