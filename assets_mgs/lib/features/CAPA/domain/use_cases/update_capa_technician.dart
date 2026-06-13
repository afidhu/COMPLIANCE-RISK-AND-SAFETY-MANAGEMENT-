



import '../entities/capa_entity.dart';
import '../repository/capa_repo.dart';

class UpdateCapaTechnicianCase {
  final CapaRepo capaRepo;

  UpdateCapaTechnicianCase(this.capaRepo);
  Future<bool> call({required String capaId, required CapaEntity capa}){
    return capaRepo.updateCapaByTechnician(capaId: capaId, capa: capa);
  }
}