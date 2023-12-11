import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
import 'package:tabarak/App/presentation/screens/page_of_elmoshaf.dart';
import 'package:tabarak/core/utils/Style.dart';
import 'package:quran/quran.dart' as quran;

import '../../../core/shared preferences/shared.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Style.mainColor.withOpacity(.6),
        //   title: const Center(
        //     child: Text(
        //       'Saved',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
        body: Consumer<QuranProvider>(builder: (context, prov, child) {
          if (MyCache.getInt(key: MyChachKey.saveCurrent) == -1) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'lib/core/assets/image/wallpaper_save.png',
                    fit: BoxFit.fill,
                    color: const Color(0xff672CBC),
                    colorBlendMode:BlendMode.lighten,
                  ),
                ),
                Center(
                    child: Image.asset('lib/core/assets/image/NoData.png')),
              ],
            );
          } else {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'lib/core/assets/image/wallpaper_save.png',
                    fit: BoxFit.fill,
                    color: const Color(0xff672CBC),
                    colorBlendMode:BlendMode.lighten,
                  ),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Container(
                        // color: Colors.grey[100],
                        color: Colors.grey.withOpacity(.25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.purple[100],
                                color: Colors.purple[100],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    quran.getVerseEndSymbol(MyCache.getInt(
                                            key: MyChachKey.indexOfAyah) +
                                        1),
                                    style: const TextStyle(fontSize: 27),
                                  ),
                                  const Spacer(),
                                  Text(
                                    quran.getSurahNameArabic(MyCache.getInt(
                                        key: MyChachKey.indexOfSura)),
                                    style: const TextStyle(fontSize: 27),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share),
                                  ),
                                  Consumer<QuranProvider>(
                                    builder: (context, prov, child) {
                                      return IconButton(
                                        onPressed: () {
                                          prov.playAudioVerse(
                                              MyCache.getInt(
                                                  key: MyChachKey.indexOfAyah),
                                              MyCache.getInt(
                                                  key: MyChachKey.indexOfSura));
                                        },
                                        icon: Icon(prov.audioCurrent ==
                                                MyCache.getInt(
                                                    key: MyChachKey.indexOfAyah)
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: ()
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PageOfElmoshaf(
                                      sura: MyCache.getInt(key: MyChachKey.indexOfSura),
                                      location:MyCache.getInt(key: MyChachKey.indexOfAyah) ,
                                    )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 20,
                                ),
                                child: Text(
                                  quran.getVerse(
                                      MyCache.getInt(key: MyChachKey.indexOfSura),
                                      (MyCache.getInt(key: MyChachKey.indexOfAyah) +
                                          1)),
                                  style: Style.quranFont,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 20,
                              ),
                              child: Text(
                                quran.getVerseTranslation(
                                    MyCache.getInt(key: MyChachKey.indexOfSura),
                                    (MyCache.getInt(key: MyChachKey.indexOfAyah) +
                                        1),
                                    translation: Translation.enSaheeh),
                                style: Style.quranFont,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            );
          }
        }));
  }
}
