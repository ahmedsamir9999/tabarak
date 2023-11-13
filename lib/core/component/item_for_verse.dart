import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';
import 'package:quran/surah_data.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
import 'package:tabarak/App/presentation/screens/saved_screen.dart';

import '../../../../core/utils/Style.dart';

class ItemForeVerse extends StatelessWidget {
  int index;
  int numOfSurah;

  final player = AudioPlayer();

  ItemForeVerse({
    super.key,
    required this.index,
    required this.numOfSurah,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuranProvider(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          // color: Colors.grey[100],
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  // color: Colors.purple[100],
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${quran.getVerseEndSymbol(index + 1)}',
                      style: TextStyle(fontSize: 27),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                    Consumer<QuranProvider>(
                      builder: (context, prov, child) {
                        return IconButton(
                          onPressed: () {
                            prov.playAudioVerse(index, numOfSurah);
                          },
                          icon: Icon(prov.audioCurrent == index
                              ? Icons.pause
                              : Icons.play_arrow),
                        );
                      },
                    ),
                    Consumer<QuranProvider>(
                      builder: (context, prov, child) {
                        return IconButton(
                          onPressed: ()
                          {
                            prov.toSave(index ,numOfSurah);
                            print('>>>>>>>>>>>>>>>>${prov.saveCurrent}');
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SavedScreen()));
                          },
                          icon: Icon(prov.saveCurrent == index
                              ? Icons.bookmark
                              : Icons.bookmark_border),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 20,
                ),
                child: Text(
                  '${quran.getVerse(numOfSurah, (index + 1))}',
                  style: Style.quranFont,
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 20,
                ),
                child: Text(
                  '${quran.getVerseTranslation(numOfSurah, (index + 1), translation: Translation.enSaheeh)}',
                  style: Style.quranFont,
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
