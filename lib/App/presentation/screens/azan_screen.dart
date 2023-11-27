import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/azan_provider.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AzanProvider().getPosition(context: context);
    return ChangeNotifierProvider(
      create: (context) => AzanProvider(),
      child: Scaffold(),
    );
  }
}
