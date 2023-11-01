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
