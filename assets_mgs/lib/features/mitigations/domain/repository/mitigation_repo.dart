

import '../entities/mitigation_entity.dart';

abstract class MitigationRepo {

  Future<List<MitigationEntity>> getMitigation(String hazardId);
  Future<bool> addMitigation(MitigationEntity mitigation);
}