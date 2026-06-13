

import '../entities/capa_entity.dart';
import '../repository/capa_repo.dart';

class GetCapaByTechnician {
  final CapaRepo capaRepo;

  GetCapaByTechnician(this.capaRepo);
  Future<List<CapaEntity>> call(String userId){
    return capaRepo.getCapaByTechnician(userId);
  }
}