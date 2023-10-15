import 'package:tabarak/App/domain/repository/base_azan_repository.dart';

import '../entities/azan.dart';

class GetAzanTimeByCityUseCase {
  final BaseAzanRepository baseAzanRepository;

  GetAzanTimeByCityUseCase(this.baseAzanRepository);

  Future<Azan> execute() async {
    return await baseAzanRepository.getAzanTimeByCity();
  }
}
