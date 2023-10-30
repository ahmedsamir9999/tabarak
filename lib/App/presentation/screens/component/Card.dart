import 'package:flutter/material.dart';

class card extends StatelessWidget {
  card({required this.nameSura, required this.verses, super.key});
  String nameSura;
  String verses;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
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
            const Text("The opening",style: TextStyle(
              fontSize: 16,
              color: Colors.white

            )),
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
            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}
