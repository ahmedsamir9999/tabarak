import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/App/presentation/screens/component/Card.dart';
import 'package:tabarak/core/utils/Style.dart';

import 'component/item_for_verse.dart';
import 'home.dart';

class PageOfElmoshaf extends StatelessWidget {
  PageOfElmoshaf({required this.index, super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
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
          quran.getSurahNameArabic(18),
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
                nameSura: "${quran.getSurahNameArabic(18)}",
                verses: " ${quran.getVerseCount(18)} : عدد الآيات "),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quran.getVerseCount(18),
              itemBuilder: (context, index) => ItemForeVerse(
                index: index,
                numOfSurah: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
