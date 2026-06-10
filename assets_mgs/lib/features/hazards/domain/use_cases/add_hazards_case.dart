
import '../entities/hazards_entity.dart';
import '../repository/hazard_repo.dart';

class AddHazardsCase {

  final HazardRepo hazardRepo;

  AddHazardsCase({required this.hazardRepo});

  Future<HazardsEntity> call(HazardsEntity hazard) async{
    return hazardRepo.addHazard(hazard);
  }
}