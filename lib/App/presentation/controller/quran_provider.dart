import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

import '../../../core/network/api_constance.dart';

class QuranProvider extends ChangeNotifier {
  bool isPlay = false;
  int iconCurrent = -1;
  Duration currentPotion = Duration();
  Duration musicLength = Duration() ;


  final player = AudioPlayer();

  // Future onTest() async
  // {
  //   await player.play(
  //     UrlSource(ApiConstance.quranUrl('001')),
  //     // position: QuranProvider().currentPotion,
  //   );
  // }

  String formatTime(int seconds)
  {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

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

  Future playAudioVerse(int index, int sura) async
  {
   if(iconCurrent == index)
   {
     player.pause();
     iconCurrent = -1 ;
   }
   else{
     iconCurrent = index;

     await player.play(
       UrlSource(quran.getAudioURLByVerse(sura, index + 1)),
     );

     player.onPlayerComplete.listen((c) {
       iconCurrent = -1;
       notifyListeners();
     });
   }
    notifyListeners();
  }

  Future playAudioSura(int sura) async
  {
    if(isPlay == true)
    {
      player.pause();
      isPlay = false;
    }else
    {
      isPlay = true;
      await player.play(
        UrlSource(ApiConstance.quranUrl('050')),
      );
      player.onPlayerComplete.listen((c) {
        isPlay = false;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  stopPlay()
  {
    player.stop();
    currentPotion = Duration.zero ;
    isPlay = false ;
    notifyListeners();
  }

  seekPlay(sec)
  {
    player.seek(Duration(seconds: sec));
    notifyListeners();
  }


}
