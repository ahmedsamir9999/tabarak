import 'package:flutter/material.dart';

import 'component/Card.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: card(nameSura: "AL-Fatiah",verses: "7"),
      ),
    );
  }
}
