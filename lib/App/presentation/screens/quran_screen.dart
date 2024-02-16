import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tabarak/App/presentation/screens/elsbha_screen.dart';
import 'package:tabarak/App/presentation/screens/page_of_elmoshaf.dart';

import '../../../core/component/Search.dart';
import '../../../core/shared preferences/shared.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/style.dart';
import '../controller/home_provider.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Center(
              child: Text(
                'دليل المسلم',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff672CBC),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ElsbhaScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Colors.purple[100],
                        color: Colors.purple.withOpacity(.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Center(
                        child: Text(
                          'السبحه',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
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
                    onTap: () {
                      HomeProvider().saveList();
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return const Search();
                        },
                      );
                    },
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
            const Text("Tanvir Ahassan", style: Style.quranFont
                //color: Colors.black,
                //fontSize: ,
                //fontWeight: FontWeight.bold

                ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: Responsive.heightPercentage(context, 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                  "lib/core/assets/image/Frame 30.png",
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.confirmation_number_sharp,
                            color: Colors.black),
                        Text("Last Read",
                            style: TextStyle(
                                color: Colors.black,
                                // fontSize: 14,
                                fontSize: Responsive.fontSize(context, 2))),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCache.getInt(key: MyChachKey.saveCurrent) == -1
                        ? const Text(
                            '',
                            style: TextStyle(fontSize: 27),
                          )
                        : Text(
                            quran.getSurahNameArabic(
                                MyCache.getInt(key: MyChachKey.indexOfSura)),
                            style: const TextStyle(fontSize: 27),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyCache.getInt(key: MyChachKey.saveCurrent) == -1
                        ? const Text(
                            '',
                            style: TextStyle(fontSize: 27),
                          )
                        : Text(
                            "Ayah No: ${(MyCache.getInt(key: MyChachKey.indexOfAyah)+1)}",
                            style: const TextStyle(
                              color: Colors.black,
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
            const Divider(
              color: Colors.black,
            ),
            Consumer<HomeProvider>(builder: (context, prov, child) {
              return SizedBox(
                height: Responsive.heightPercentage(context, 40),
                child: PageView(
                  controller: prov.pageController,
                  onPageChanged: (value) => prov.pageController,
                  children: [
                    ListView.separated(
                      separatorBuilder: (context, index) => Column(
                        children: [
                          Divider(
                            color: Colors.grey[200],
                            height: 50,
                            thickness: 1.5,
                          )
                        ],
                      ),
                      itemBuilder: (context, index) => InkWell(
                        child: SizedBox(
                          height: 60,
                          width: 100,
                          child: Row(
                            children: [
                              Text(quran.getVerseEndSymbol(index + 1),
                                  style: TextStyle(
                                      fontSize:
                                          Responsive.fontSize(context, 3))),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(quran.getSurahName(index + 1),
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.fontSize(context, 2))),
                                  Text(
                                      '${quran.getVerseCount(index + 1)} : عدد الآيات ',
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.fontSize(context, 2))),
                                ],
                              ),
                              const Spacer(),
                              Text(quran.getSurahNameArabic(index + 1),
                                  style: TextStyle(
                                      fontSize:
                                          Responsive.fontSize(context, 2))),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PageOfElmoshaf(sura: (index + 1)),
                          ));
                        },
                      ),
                      itemCount: 114,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => SizedBox(
                        height: 100,
                        width: 100,
                        child: Text(quran.getSurahNameArabic(index + 1),
                            style: TextStyle(
                                fontSize: Responsive.fontSize(context, 2))),
                      ),
                      itemCount: 114,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => SizedBox(
                        height: 100,
                        width: 100,
                        child: Text('${quran.getPageData(index + 1)}',
                            style: TextStyle(
                                fontSize: Responsive.fontSize(context, 2))),
                      ),
                      itemCount: 114,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => Column(
                        children: [
                          Divider(
                            color: Colors.grey[200],
                            height: 50,
                            thickness: 1.5,
                          )
                        ],
                      ),
                      itemBuilder: (context, index) => SizedBox(
                        height: 60,
                        width: 100,
                        child: Row(
                          children: [
                            Text(quran.getVerseEndSymbol(index + 1),
                                style: TextStyle(
                                    fontSize: Responsive.fontSize(context, 3))),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(quran.getSurahNameArabic(index + 1),
                                    style: TextStyle(
                                        fontSize:
                                            Responsive.fontSize(context, 2))),
                                Text('${quran.getVerseCount(18)} : عدد الآيات ',
                                    style: TextStyle(
                                        fontSize:
                                            Responsive.fontSize(context, 2))),
                              ],
                            )
                          ],
                        ),
                      ),
                      itemCount: 114,
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      )),
    );
  }
}
