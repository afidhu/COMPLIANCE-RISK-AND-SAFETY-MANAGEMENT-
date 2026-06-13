
import '../entities/hazards_entity.dart';
import '../repository/hazard_repo.dart';

class AddHazardsCase {

  final HazardRepo hazardRepo;

  AddHazardsCase( this.hazardRepo);

  Future<bool> call(HazardsEntity hazard) async{
    return await hazardRepo.addHazard(hazard);
  }
}