import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
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
                  IconButton(
                    onPressed: ()async
                    {
                      await player.play(UrlSource(quran.getAudioURLByVerse(numOfSurah, index+1)));
                      print(quran.getAudioURLByVerse(numOfSurah, index+1));
                    },
                    icon: Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
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
          ],
        ),
      ),
    );
  }
}
