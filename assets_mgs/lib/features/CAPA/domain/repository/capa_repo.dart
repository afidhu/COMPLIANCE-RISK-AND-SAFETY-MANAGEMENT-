

import '../entities/capa_entity.dart';

abstract class CapaRepo {

  Future<List<CapaEntity>> getCapa(String hazardId);
  Future<bool> addCapa(CapaEntity capa);
}