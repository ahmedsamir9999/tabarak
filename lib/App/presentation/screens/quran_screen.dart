import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      // onTap: () => ,
                        child: Image.asset("lib/core/assets/image/menu.png")),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Quran App",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Color(0xff672CBC))),
                    const Spacer(),
                    InkWell(
                      // onTap: () => ,
                        child: Image.asset("lib/core/assets/image/search.png")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Asslamualaikum",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tanvir Ahassan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 326,
                  height: 131,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/core/assets/image/Frame 30.png")),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.confirmation_number_sharp,
                                color: Colors.white),
                            Text("Last Read",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Al-Fatiah",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Ayah No:1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Surah",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Para",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Page",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Hijb",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 350,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      child: Text('${quran.getSurahName(index+1)}'),
                    ),
                    itemCount: 114,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
