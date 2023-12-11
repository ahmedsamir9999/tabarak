import 'package:flutter/material.dart';

class ElsbhaScreen extends StatefulWidget {
  const ElsbhaScreen({super.key});

  @override
  State<ElsbhaScreen> createState() => _ElsbhaScreenState();
}

class _ElsbhaScreenState extends State<ElsbhaScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/core/assets/image/wallpaper_sebha.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                        '$count',
                      style:  const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(
                      flex: 4,
                    ),
                    IconButton(
                        onPressed: ()
                        {
                          setState(() {
                            count++;
                          });
                        },
                        icon: const Icon(Icons.add_circle,
                          color: Colors.white,
                          size: 70,
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                        onPressed: ()
                        {
                          setState(() {
                            count = 0 ;
                          });
                        },
                        icon: const Icon(Icons.restart_alt,
                          color: Colors.white,
                          size: 70,
                        )),
                    const Spacer(),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
