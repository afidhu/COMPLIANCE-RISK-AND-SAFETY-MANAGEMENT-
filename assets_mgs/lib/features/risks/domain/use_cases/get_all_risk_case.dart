


import '../entities/risk_entity.dart';
import '../repository/risk_repo.dart';

class GetAllRiskCase {
  final RiskRepo riskRepo;

  GetAllRiskCase(this.riskRepo);
  Future<List<RiskEntity>> call(){
    return riskRepo.getAllRisk();
  }
}