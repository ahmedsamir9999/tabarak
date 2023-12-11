import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

import '../../../core/network/api_constance.dart';

class QuranProvider extends ChangeNotifier {

  bool isPlay = false;
  int audioCurrent = -1;
  int saveCurrent = -1;
  Duration currentPotion = const Duration();
  Duration musicLength = const Duration() ;



  final player = AudioPlayer();


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

  toSave(int index)
  {
    if(saveCurrent == index )
    {
      saveCurrent = -1 ;
    }
    else{
      saveCurrent = index ;
    }
    notifyListeners();
  }

  Future playAudioVerse(int index, int sura) async
  {
   if(audioCurrent == index)
   {
     player.pause();
     audioCurrent = -1 ;
   }
   else{
     audioCurrent = index;

     await player.play(
       UrlSource(quran.getAudioURLByVerse(sura, index + 1)),
     );

     player.onPlayerComplete.listen((c) {
       audioCurrent = -1;
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
        UrlSource(ApiConstance.quranUrl(threeDigit(sura))),
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



  threeDigit(int y)
  {
    int x;
    String z;
    x = y.toString().length;
    if ( x == 1) {z = "00$y";}
    else if (x == 2) {z = "0$y";}
    else if (x == 3) {z = "$y" ;}
    else {z = "000";}
    return z;
  }

}
