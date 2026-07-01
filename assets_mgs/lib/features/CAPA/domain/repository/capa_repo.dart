

import '../entities/capa_entity.dart';

abstract class CapaRepo {

  Future<List<CapaEntity>> getCapa(String hazardId);
  Future<List<CapaEntity>> getCapaByTechnician(String userId);
  Future<bool> updateCapaByTechnician({ required String capaId,required CapaEntity capa});
  Future<bool> addCapa(CapaEntity capa);
  Future<List<CapaEntity>> getCompletedApprovedCapaByTechnician(String userId);
}