import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/core/utils/Style.dart';

class PageOfElmoshaf extends StatelessWidget {
  const PageOfElmoshaf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.mainColor,
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
            SizedBox(height: 10,),
            Container(
              width: 326,
              height: 131,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/core/assets/image/Frame 30.png")),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.confirmation_number_sharp,
                            color: Colors.white),
                        Text("Last Read",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(quran.getSurahName(18),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Ayah No: 18 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ),
            Text(
              quran.basmala,
              style: Style.quranFont,
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quran.getVerseCount(18),
              itemBuilder: (context, index) => Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(10),
                child: Text(
                  '${quran.getVerse(18, (index + 1), verseEndSymbol: true)}',
                  style: Style.quranFont,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
