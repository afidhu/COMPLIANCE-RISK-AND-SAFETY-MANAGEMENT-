

import '../entities/risk_entity.dart';
import '../repository/risk_repo.dart';

class AddRiskCase {

  final RiskRepo riskRepo;

  AddRiskCase(this.riskRepo);

  Future<bool> call(RiskEntity risk){
    return riskRepo.addRisk(risk);
  }

}