import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../App/presentation/controller/quran_provider.dart';

class Caard extends StatelessWidget {
  String nameSura;
  String verses;
  int sura;

  Caard(
      {required this.nameSura,
      required this.verses,
      required this.sura,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuranProvider(),
      child: Container(
        height: 310,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/core/assets/image/Card.png"))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(nameSura,
                  style: const TextStyle(fontSize: 26, color: Colors.white)),
              Consumer<QuranProvider>(
                builder: (context, prov, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            prov.formatTime(prov.currentPotion.inSeconds),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Slider(
                            value: prov.currentPotion.inSeconds.toDouble(),
                            max: prov.musicLength.inSeconds.toDouble(),
                            min: 0,
                            onChanged: (value) {
                              print(value);
                              prov.seekPlay(value.toInt());
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,

                          ),
                          Text(
                              prov.formatTime(prov.musicLength.inSeconds-prov.currentPotion.inSeconds),
                            style: const TextStyle(color: Colors.white),
                          ),

                          // Text(
                          //   ((prov.musicLength -
                          //       prov.currentPotion))
                          //       .toString(),
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                                prov.isPlay == false
                                    ? Icons.play_circle
                                    : Icons.pause_circle,
                                color: Colors.white),
                            onPressed: () async {
                              prov.playAudioSura(sura);
                              prov.onPlay();
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.stop, color: Colors.white),
                            onPressed: () {
                              prov.stopPlay();
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const Divider(
                height: 7,
                color: Colors.white,
                indent: 70,
                endIndent: 70,
              ),
              const Spacer(),
              Text(" $verses ",
                  style: const TextStyle(fontSize: 14, color: Colors.white)),
              const Spacer(),
              const Image(
                  image: AssetImage("lib/core/assets/image/opening.png")),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
