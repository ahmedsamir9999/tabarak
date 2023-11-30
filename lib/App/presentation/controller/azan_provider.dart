

import 'package:adhan/adhan.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tabarak/core/shared%20preferences/shared.dart';

class AzanProvider extends ChangeNotifier
{
  Position? cl;



  final Connectivity connectivity = Connectivity();


  AzanProvider(context)
  {
    // connectivity.onConnectivityChanged.listen((updateConnectivity));
     getPosition(context: context);
     getAzanTime();
     notifyListeners();
  }

  PrayerTimes getAzanTime()
  {
    final myCoordinates =
    Coordinates(
        MyCache.getDouble(key: MyChachKey.lat)!.toDouble(),
        MyCache.getDouble(key: MyChachKey.lot)!.toDouble()); // Replace with your own location lat, lng.
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    return prayerTimes ;
  }


  Future getPosition({required context}) async {
    bool services = await Geolocator.isLocationServiceEnabled();
    LocationPermission? per;
    if(MyCache.getDouble(key: MyChachKey.lot)== -1.0 )
    {
      if (services == false) {
        AwesomeDialog(
            context: context,
            title: 'Error',
            body: const Text(
              'GPS not Enable',
              style: TextStyle(
                fontSize: 20,
              ),
            )).show();
      }
      else {
        // print('>>>>>>>>>>>>>>>>>${per}');

        per = await Geolocator.checkPermission();

        // print('>>>>>>>>>>>>>>>>>${per}');

        if (per == LocationPermission.denied) {
          per = await Geolocator.requestPermission();
        }

        // print('>>>>>>>>>>>>>>>>>${per}');

        if (per == LocationPermission.whileInUse ||
            per == LocationPermission.always) {
          cl = await Geolocator.getCurrentPosition();
          MyCache.setDouble(key: MyChachKey.lat, value: cl!.latitude);
          MyCache.setDouble(key: MyChachKey.lot, value: cl!.longitude);
        }
      }
    }

    notifyListeners();

  }
}