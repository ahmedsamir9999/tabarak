import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/azan_provider.dart';

import '../../../core/utils/Style.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AzanProvider(context),
      child: Consumer<AzanProvider>(
        builder: (context,prov , child)
        {
          return Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset('lib/core/assets/image/wallpaper.png',
                    fit: BoxFit.fill,
                    // color: Colors.white.withOpacity(.2),
                    // colorBlendMode:BlendMode.screen,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 6),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                              backgroundBlendMode: BlendMode.darken
                          ),
                          child: Text(
                            ' رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي ۚ رَبَّنَا وَتَقَبَّلْ دُعَاءِ ',
                            style: TextStyle(
                              color: Style.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                      Spacer(flex: 3),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.brown,
                          backgroundBlendMode: BlendMode.darken
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              DateFormat.jm().format(prov.getAzanTime().fajr),
                              style: TextStyle(
                                color: Style.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              ' : صلاة الفجْر ',
                              style: TextStyle(
                                color: Style.whiteColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                            color: Colors.brown,
                          backgroundBlendMode: BlendMode.darken
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              DateFormat.jm().format(prov.getAzanTime().dhuhr),
                              style: TextStyle(
                                color: Style.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              ' : صلاة الظُّهْر ',
                              style: TextStyle(
                                color: Style.whiteColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      ),
                      Spacer(),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                              backgroundBlendMode: BlendMode.darken
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                DateFormat.jm().format(prov.getAzanTime().asr),
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : صلاة العَصر ',
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          )
                      ),
                      Spacer(),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                              backgroundBlendMode: BlendMode.darken
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                DateFormat.jm().format(prov.getAzanTime().maghrib),
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : صلاة المَغرب ',
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          )
                      ),
                      Spacer(),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                              backgroundBlendMode: BlendMode.darken
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                DateFormat.jm().format(prov.getAzanTime().isha),
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : صلاة العِشاء ',
                                style: TextStyle(
                                  color: Style.whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          )
                      ),
                      Spacer(flex: 12),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
