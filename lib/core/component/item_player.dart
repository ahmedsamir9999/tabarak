import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/quran_provider.dart';

class ItemPlayer extends StatelessWidget {
  const ItemPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: IconButton(
        icon: Icon(Icons.edit_calendar, size: 50),
        onPressed: () {
          QuranProvider().playAudioVerse(1, 1);
          QuranProvider().onPlay();
          showDialog(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider(
                    create: (context) => QuranProvider(),
                child:AlertDialog(
                  title: Center(child: Text('مشاري')),
                  shape: CircleBorder(
                    eccentricity: 1,
                    side: BorderSide(strokeAlign: 10),
                  ),
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Consumer<QuranProvider>(
                            builder: (context , prov , child )
                            {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    prov.currentPotion.toString(),
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
                                    prov.currentPotion.toString(),
                                    style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                                  ),
                                ],
                              );
                            }),
                        Icon(
                          Icons.pause_circle,
                          size: 45,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ), );
              });
        },
      ),
    ));
  }
}
