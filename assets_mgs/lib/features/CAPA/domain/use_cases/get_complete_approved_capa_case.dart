


import '../entities/capa_entity.dart';
import '../repository/capa_repo.dart';

class GetCompleteApprovedCapaCase {
  final CapaRepo _capaRepo;

  GetCompleteApprovedCapaCase(this._capaRepo);
  Future<List<CapaEntity>> call(String userId){
    return _capaRepo.getCompletedApprovedCapaByTechnician(userId);
  }
}