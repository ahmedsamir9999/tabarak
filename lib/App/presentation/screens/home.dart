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
              selectedItemColor: Colors.white,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: prov.currentIndex,
              backgroundColor: Color(0xff672CBC).withOpacity(.6),
              onTap: (index)
              {
                prov.changeIndex(index);
              },
              items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: 'القرآن الكريم'),
              BottomNavigationBarItem(
                  icon:
                  ImageIcon(AssetImage('lib/core/assets/image/azan.png'),),
                  label: 'مواقيت الصلاة'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'حفظ'),
              ],
            );
          },
        ),
      ),
    );
  }
}
