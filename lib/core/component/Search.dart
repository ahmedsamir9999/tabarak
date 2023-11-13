import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabarak/App/presentation/controller/home_provider.dart';
import 'package:quran/quran.dart' as quran;
class Search extends StatelessWidget {
   Search({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, pro, Widget? child)
        {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        pro.test(value);
                        print(pro.showList);
                        // pro.showList=pro.suraList.where((element) => element.contains(value),).toList();


                        // pro.showList=pro.suraList;
                      },
                    ),
                  ),
                  // ListView.builder(
                  //   itemBuilder: (context, index) =>
                  //       Text(pro.suraList as String)
                  //   ,)
                  Text(pro.ttt,style: const TextStyle(decorationColor: Colors.black,fontSize: 50),),
                  TextButton(onPressed: (){
                    pro.saveList();

                    print(pro.suraList);
                  },
                      child: Text("Button"))
                ],
              ),
            ),
          ); },

      ),

    );
  }
}
