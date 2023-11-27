
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AzanProvider extends ChangeNotifier
{
  Position? cl;

  final Connectivity connectivity = Connectivity();


  // void updateConnectivity(ConnectivityResult connectivityResult) {
  //   if (connectivityResult == ConnectivityResult.none) {
  //     Get.rawSnackbar(
  //         messageText: const Text('PLEASE CONNECT TO THE INTERNET',
  //             style: TextStyle(color: Colors.white, fontSize: 14)),
  //         isDismissible: false,
  //         duration: const Duration(days: 1),
  //         backgroundColor: Colors.red[400]!,
  //         icon: const Icon(
  //           Icons.wifi_off,
  //           color: Colors.white,
  //           size: 35,
  //         ),
  //         margin: EdgeInsets.zero,
  //         snackStyle: SnackStyle.GROUNDED);
  //   } else {
  //     if (Get.isSnackbarOpen) {
  //       Get.closeCurrentSnackbar();
  //     }
  //   }
  // }

  Future getPosition({required context}) async {
    bool services = await Geolocator.isLocationServiceEnabled();
    LocationPermission? per;

    if (services == false) {
      AwesomeDialog(
          context: context,
          title: 'Error',
          body: Text(
            'GPS not Enable',
            style: TextStyle(
              fontSize: 20,
            ),
          )).show();
    }

    print('>>>>>>>>>>>>>>>>>${per}');

    per = await Geolocator.checkPermission();

    print('>>>>>>>>>>>>>>>>>${per}');

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }

    print('>>>>>>>>>>>>>>>>>${per}');

    if (per == LocationPermission.whileInUse ||
        per == LocationPermission.always) {
      cl = await Geolocator.getCurrentPosition();
    }

    notifyListeners();
  }
}