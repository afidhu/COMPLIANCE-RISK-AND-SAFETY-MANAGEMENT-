

import '../entities/risk_entity.dart';
import '../repository/risk_repo.dart';

class GetRiskCase {
  final RiskRepo riskRepo;

  GetRiskCase(this.riskRepo);
  Future<List<RiskEntity>> call(String hazardId){
    return riskRepo.getRisk(hazardId);
  }
}