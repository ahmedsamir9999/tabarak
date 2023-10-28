import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

import '../../../core/utils/responsive.dart';
import '../../../core/utils/style.dart';
import '../controller/home_provider.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        // onTap: () => ,
                        child: Image.asset("lib/core/assets/image/menu.png")),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Quran App",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Color(0xff672CBC))),
                    const Spacer(),
                    InkWell(
                        // onTap: () => ,
                        child: Image.asset("lib/core/assets/image/search.png")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Asslamualaikum",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text("Tanvir Ahassan", style: Style.quranFont
                    //color: Colors.black,
                    //fontSize: ,
                    //fontWeight: FontWeight.bold

                    ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // width: 326,
                  width: Responsive.widthPercentage(context, 85),
                  // height: 131,
                  height: Responsive.heightPercentage(context, 18),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("lib/core/assets/image/Frame 30.png")),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.confirmation_number_sharp,
                                color: Colors.white),
                            Text("Last Read",
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: 14,
                                    fontSize: Responsive.fontSize(context, 2))),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Al-Fatiah",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Ayah No:1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<HomeProvider>(builder: (context, prov, child) {
                  return Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            prov.changePage(0);
                          },
                          child: Text(
                            "Surah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 16,
                              fontSize: Responsive.fontSize(context, 2),
                              color: Colors.black,
                            ),
                          )),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            prov.changePage(1);

                          },
                          child: Text(
                            "Para",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 16,
                              fontSize: Responsive.fontSize(context, 2),
                              color: Colors.black,
                            ),
                          )),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            prov.changePage(2);
                          },
                          child: Text(
                            "Page",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 16,
                              fontSize: Responsive.fontSize(context, 2),
                              color: Colors.black,
                            ),
                          )),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            prov.changePage(3);
                          },
                          child: Text(
                            "Hijb",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 16,
                              fontSize: Responsive.fontSize(context, 2),
                              color: Colors.black,
                            ),
                          )),
                    ],
                  );
                }),
                Divider(
                  color: Colors.black,
                ),
                Consumer<HomeProvider>(builder: (context, prov, child) {
                  return SizedBox(
                    height: Responsive.heightPercentage(context, 40),
                    child: ChangeNotifierProvider(
                      create: (context) => HomeProvider(),
                      child: PageView(
                        controller:prov.pageController,
                        onPageChanged: (value) => prov.pageController,
                        children: [
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => Container(
                              height: 100,
                              width: 100,
                              child: Text('${quran.getSurahName(index + 1)}',
                                  style: TextStyle(
                                      fontSize:
                                          Responsive.fontSize(context, 2))),
                            ),
                            itemCount: 114,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => Container(
                              height: 100,
                              width: 100,
                              child: Text('${quran.getSurahNameArabic(index + 1)}',
                                  style: TextStyle(
                                      fontSize:
                                      Responsive.fontSize(context, 2))),
                            ),
                            itemCount: 114,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => Container(
                              height: 100,
                              width: 100,
                              child: Text('${quran.getPageData(index + 1)}',
                                  style: TextStyle(
                                      fontSize:
                                      Responsive.fontSize(context, 2))),
                            ),
                            itemCount: 114,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => Container(
                              height: 100,
                              width: 100,
                              child: Text('${quran.getVerseCount(index + 1)}',
                                  style: TextStyle(
                                      fontSize:
                                      Responsive.fontSize(context, 2))),
                            ),
                            itemCount: 114,
                          ),

                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          )),
        ));
  }
}
