

import '../entities/capa_entity.dart';
import '../repository/capa_repo.dart';

class GetCapaCase {
  final CapaRepo capaRepo;

  GetCapaCase(this.capaRepo);
  Future<List<CapaEntity>> call(String hazardId){
    return capaRepo.getCapa(hazardId);
  }
}