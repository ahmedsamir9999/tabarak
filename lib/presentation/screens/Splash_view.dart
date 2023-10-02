import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Quran App",
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 20,),
                const Text("Learn Quran and ", style: TextStyle(fontSize: 18)),
                const Text(" Recite once everyday",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 50,),
                Image.asset("lib/image/Group 35.png"),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Container(
              color: Colors.black,
              height: 100,
              width: 100,

            ),
          )
        ],

        ),
      ),
    ));
  }
}
