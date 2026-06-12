
import '../entities/risk_entity.dart';

abstract  class RiskRepo {

  Future<List<RiskEntity>> getRisk(String hazardId);
  Future<List<RiskEntity>> getAllRisk();
  Future<bool> addRisk(RiskEntity risk);
}