import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/home_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> HomeProvider(),
      child: Scaffold(
        body: Consumer<HomeProvider>(
          builder: (context , prov , child)
          {
            return prov.screens[prov.currentIndex];
          },
        ),
        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (context, prov, child)
          {
            return BottomNavigationBar(
              iconSize: 30,
              selectedItemColor: Colors.purple,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: prov.currentIndex,
              onTap: (index)
              {
                prov.changeIndex(index);
              },
              items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active_rounded), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Health'),
              ],
            );
          },
        ),
      ),
    );
  }
}
