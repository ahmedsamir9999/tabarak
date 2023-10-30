import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/core/utils/Style.dart';

import 'component/item_for_verse.dart';

class PageOfElmoshaf extends StatelessWidget {
  const PageOfElmoshaf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
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
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/core/assets/image/Card.png"))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                        quran.getSurahNameArabic(18),
                        style: TextStyle(
                            fontSize: 26,
                          color: Style.whiteColor
                        ),),
                    Spacer(),
                    Text("The opening",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                    Spacer(),
                    SizedBox(
                      width: 250,
                      child: Divider(
                        height: 10,
                        color:Style.whiteColor,
                      ),
                    ),
                    Spacer(),
                    Text(" ${quran.getVerseCount(18)} : عدد الآيات ",
                        style: TextStyle(
                            fontSize: 14,
                          color: Style.whiteColor,
                        )),
                    Spacer(),
                    const Image(
                        image: AssetImage("lib/core/assets/image/opening.png")),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
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
