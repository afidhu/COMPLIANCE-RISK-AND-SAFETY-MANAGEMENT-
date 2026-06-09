

import '../entities/hazards_entity.dart';
import '../repository/hazard_repo.dart';

class GetAllHazards {
  final HazardRepo hazardRepo;

  GetAllHazards({required this.hazardRepo});

  Future<List<HazardsEntity>> call(){
    return hazardRepo.getHazard();
  }
}