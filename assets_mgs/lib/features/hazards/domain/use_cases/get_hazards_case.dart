

import '../entities/hazards_entity.dart';
import '../repository/hazard_repo.dart';

class GetHazardsCase {
  final HazardRepo hazardRepo;

  GetHazardsCase(this.hazardRepo);

  Future<List<HazardsEntity>> call(){
    return hazardRepo.getHazard();
  }
}