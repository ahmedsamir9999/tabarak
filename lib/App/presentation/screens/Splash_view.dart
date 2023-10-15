import 'package:flutter/material.dart';

import 'home.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Quran App",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff672CBC),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Learn Quran and ",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const Text(" Recite once everyday",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset("lib/core/assets/image/Group 35.png"),
                ],
              ),
            ),
            Positioned(
              top: 650,
              left: 0,
              right: 0,
              child: Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      )),
                  child: Container(
                    height: 60,
                    width: 185,
                    decoration: const BoxDecoration(
                        color: Color(0xffF9B091),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
