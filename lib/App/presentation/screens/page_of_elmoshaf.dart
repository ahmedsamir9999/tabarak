import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
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
            onPressed: () {},
            icon: Icon(
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
            card(
                nameSura: "${quran.getSurahNameArabic(sura)}",
                verses: " ${quran.getVerseCount(sura)} : عدد الآيات ",
              sura: sura,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
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
