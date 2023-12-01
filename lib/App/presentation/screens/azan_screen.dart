import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/azan_provider.dart';
import 'package:tabarak/core/shared%20preferences/shared.dart';

import '../../../core/utils/Style.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AzanProvider(context),
      child: Consumer<AzanProvider>(
        builder: (context, prov, child) {
          return MyCache.getDouble(key: MyChachKey.lot) == -1
              ? Scaffold(
                  body: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          'lib/core/assets/image/wallpaper.png',
                          fit: BoxFit.fill,
                          // color: Colors.white.withOpacity(.2),
                          // colorBlendMode:BlendMode.screen,
                        ),
                      ),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.brown,
                                backgroundBlendMode: BlendMode.darken),
                            child: const Text(
                              ' يجب تشغيل GPS لتحديد الموقع ِ',
                              style: TextStyle(
                                color: Style.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      )
                    ],
                  ),
                )
              : Scaffold(
                  body: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          'lib/core/assets/image/wallpaper.png',
                          fit: BoxFit.fill,
                          // color: Colors.white.withOpacity(.2),
                          // colorBlendMode:BlendMode.screen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(flex: 6),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown,
                                    backgroundBlendMode: BlendMode.darken),
                                child: const Text(
                                  ' رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي ۚ رَبَّنَا وَتَقَبَّلْ دُعَاءِ ',
                                  style: TextStyle(
                                    color: Style.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const Spacer(flex: 3),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown.withOpacity(.5),
                                    backgroundBlendMode: BlendMode.darken),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      DateFormat.jm()
                                          .format(prov.getAzanTime().fajr),
                                      style: const TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      ' : صلاة الفجْر ',
                                      style: TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown.withOpacity(.5),
                                    backgroundBlendMode: BlendMode.darken),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      DateFormat.jm()
                                          .format(prov.getAzanTime().dhuhr),
                                      style: const TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      ' : صلاة الظُّهْر ',
                                      style: TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown.withOpacity(.5),
                                    backgroundBlendMode: BlendMode.darken),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      DateFormat.jm()
                                          .format(prov.getAzanTime().asr),
                                      style: const TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      ' : صلاة العَصر ',
                                      style: TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown.withOpacity(.5),
                                    backgroundBlendMode: BlendMode.darken),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      DateFormat.jm()
                                          .format(prov.getAzanTime().maghrib),
                                      style: const TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      ' : صلاة المَغرب ',
                                      style: TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown.withOpacity(.5),
                                    backgroundBlendMode: BlendMode.darken),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      DateFormat.jm()
                                          .format(prov.getAzanTime().isha),
                                      style: const TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      ' : صلاة العِشاء ',
                                      style: TextStyle(
                                        color: Style.whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                            const Spacer(flex: 12),
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
