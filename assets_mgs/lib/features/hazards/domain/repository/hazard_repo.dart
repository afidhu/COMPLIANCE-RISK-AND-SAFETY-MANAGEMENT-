


 import '../entities/hazards_entity.dart';

abstract class HazardRepo {
  Future<List<HazardsEntity>> getHazard();

 }