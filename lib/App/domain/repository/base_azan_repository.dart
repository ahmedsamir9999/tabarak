import '../entities/azan.dart';

abstract class BaseAzanRepository {
  Future<Azan> getAzanTimeByCity(String city, String country);
}
