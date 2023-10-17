import 'dart:convert';

import 'package:tabarak/core/network/api_constance.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_messege_model.dart';
import '../models/azan model.dart';
import 'package:http/http.dart' as http;

abstract class BaseAzanRemoteDataSource {
  Future<AzanModel> getAzanTimeByCity(String city, String country);
}

class AzanRemoteDataSource extends BaseAzanRemoteDataSource {
  @override
  Future<AzanModel> getAzanTimeByCity(String city, String country) async {
    final response = await http.get(Uri.parse(
        '${ApiConstance.azanTimingByCity}?city=$city&country=$country'));
    if (response.statusCode == 200) {
      return AzanModel.fromJson(json.decode(response.body));
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.body),
      );
    }
  }
}
