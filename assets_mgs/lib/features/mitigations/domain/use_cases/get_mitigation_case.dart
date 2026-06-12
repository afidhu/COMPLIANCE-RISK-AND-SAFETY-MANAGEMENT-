

import '../entities/mitigation_entity.dart';
import '../repository/mitigation_repo.dart';

class GetMitigationCase {
  final MitigationRepo mitigationRepo;

  GetMitigationCase(this.mitigationRepo);

  Future<List<MitigationEntity>> call(String hazardId)async{
    return mitigationRepo.getMitigation(hazardId);
}
}