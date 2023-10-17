import 'package:tabarak/App/data/data%20source/azan_remote_data_source.dart';
import 'package:tabarak/App/domain/entities/azan.dart';
import 'package:tabarak/App/domain/repository/base_azan_repository.dart';

class AzanRepository implements BaseAzanRepository {
  final BaseAzanRemoteDataSource baseAzanRemoteDataSource;

  AzanRepository(this.baseAzanRemoteDataSource);

  @override
  Future<Azan> getAzanTimeByCity(String city, String country) async {
    return await baseAzanRemoteDataSource.getAzanTimeByCity(city, country);
  }
}
