import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/core/utils/Style.dart';


import '../../../core/component/Card.dart';
import '../../../core/component/item_for_verse.dart';
import 'home.dart';

class PageOfElmoshaf extends StatelessWidget {
  int sura;

  PageOfElmoshaf({
    super.key,
    required this.sura,
  });

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        title: Center(
            child: Text(
          quran.getSurahNameArabic(sura),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Caard(
                nameSura: quran.getSurahNameArabic(sura),
                verses: " ${quran.getVerseCount(sura)} : عدد الآيات ",
              sura: sura,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quran.getVerseCount(sura),
              itemBuilder: (context, index) => ItemForeVerse(
                index: index,
                numOfSurah: sura,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
