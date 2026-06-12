

import '../entities/compliance_entity.dart';
import '../repository/compliance_repo.dart';

class GetComplianceCase {
  final ComplianceRepo complianceRepo;

  GetComplianceCase(this.complianceRepo);

  Future<List<ComplianceEntity>> getCompliance(){
    return complianceRepo.getCompliance();
  }
}