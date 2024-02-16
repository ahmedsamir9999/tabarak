import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/Style.dart';
import '../shared preferences/shared.dart';

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
    return Padding(
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
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    quran.getVerseEndSymbol(index + 1),
                    style: const TextStyle(fontSize: 27),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){
                      onShare(
                        context,
                        quran.getVerse(numOfSurah, (index + 1)),
                       "ايه",
                      );
                    },
                    child: const Icon(Icons.share),
                  ),
                  Consumer<QuranProvider>(
                    builder: (context, prov, child) {
                      return IconButton(
                        onPressed: () async
                        {
                          await prov.playAudioVerse(index, numOfSurah);
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
                          prov.toSave(index);
                          MyCache.setInt(key: MyChachKey.saveCurrent, value: prov.saveCurrent) ;
                          MyCache.setInt(key: MyChachKey.indexOfAyah, value: (index)) ;
                          MyCache.setInt(key: MyChachKey.indexOfSura, value: numOfSurah) ;
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
                quran.getVerse(numOfSurah, (index + 1)),
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
                quran.getVerseTranslation(numOfSurah, (index + 1), translation: Translation.enSaheeh),
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
    );
  }
}


void onShare(BuildContext context,text,subject) async {
  // A builder is used to retrieve the context immediately
  // surrounding the ElevatedButton.
  //
  // The context's `findRenderObject` returns the first
  // RenderObject in its descendent tree when it's not
  // a RenderObjectWidget. The ElevatedButton's RenderObject
  // has its position and size after it's built.
  final box = context.findRenderObject() as RenderBox?;
    await Share.share(text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
