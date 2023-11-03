import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class QuranProvider extends ChangeNotifier {
  bool isPlay = false;
  int iconCurrent = -1;
  Duration currentPotion = Duration();
  Duration musicLength = Duration() ;


  final player = AudioPlayer();

  onPlay()
  {
    player.onPositionChanged.listen((value) {
      currentPotion = value ;
      notifyListeners();
    });

    player.onDurationChanged.listen((value) {
      musicLength = value ;
      notifyListeners();
    });
  }

  Future playAudioVerse(int index, int sura) async {
    iconCurrent = index;

    await player.play(
      UrlSource(quran.getAudioURLByVerse(sura, index + 1)),
    );

    player.onPlayerComplete.listen((c) {
      iconCurrent = -1;
      notifyListeners();
    });

    notifyListeners();
  }

  Future playAudioSura(int sura) async {
    isPlay = true;
    await player.play(
      UrlSource(quran.getAudioURLByVerse(1, 1)),
    );
    player.onPlayerComplete.listen((c) {
      isPlay = false;
      notifyListeners();
    });
    // isPlay = false;
    notifyListeners();
  }


}
