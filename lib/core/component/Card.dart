import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../App/presentation/controller/quran_provider.dart';

class card extends StatelessWidget {

  String nameSura;
  String verses;
  int sura ;

  card({
    required this.nameSura,
    required this.verses,
    required this.sura,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> QuranProvider(),
    child: Container(
      height: 320,
      width: 450,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/core/assets/image/Card.png"))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Text(nameSura,style: TextStyle(
              fontSize: 26,
              color: Colors.white
            )),
            Spacer(),
            Consumer<QuranProvider>(
              builder: (context,prov,child)
              {
                return IconButton(
                  onPressed: ()
                  {
                    prov.playAudioSura(sura);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return
                            AlertDialog(
                              title: Center(child: Text('مشاري')),
                              shape: CircleBorder(
                                eccentricity: 1,
                                side: BorderSide(strokeAlign: 10),
                              ),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          prov.currentPotion.inSeconds.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Slider(
                                          value: 5,
                                          min: 0,
                                          max: 10,
                                          onChanged: (value) {},
                                        ),
                                        Text(
                                            prov.musicLength.inSeconds.toString(),
                                          style:
                                          TextStyle(fontSize: 12, color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.pause_circle,
                                      size: 45,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                            );
                        });
                  } ,
                  icon: Icon( prov.isPlay == true
                      ?Icons.pause_circle
                      :Icons.play_circle ,
                    size: 40,
                    color: Colors.white,
                  ),
                );
              },
            ),
            Spacer(),
            Divider(
              height: 7,
              color: Colors.white,
              indent: 70,
              endIndent: 70,
            ),
            Spacer(),
            Text(" $verses ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white
            )),
            Spacer(),
            const Image(image: AssetImage("lib/core/assets/image/opening.png")),
            SizedBox(height: 65,),
          ],
        ),
      ),),
    );
  }
}
