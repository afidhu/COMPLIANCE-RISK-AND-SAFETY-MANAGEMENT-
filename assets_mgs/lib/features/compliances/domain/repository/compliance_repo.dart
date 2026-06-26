


import '../entities/compliance_entity.dart';

abstract class ComplianceRepo {
  Future<List<ComplianceEntity>> getCompliance();
  Future<bool> addCompliance(ComplianceEntity compliance);

  Future<bool> updateCompliance({ required ComplianceEntity compliance,required String id});
}