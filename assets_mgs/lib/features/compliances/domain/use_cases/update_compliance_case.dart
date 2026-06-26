
import '../entities/compliance_entity.dart';
import '../repository/compliance_repo.dart';

class UpdateComplianceCase {

  final ComplianceRepo _complianceRepo;

  UpdateComplianceCase(this._complianceRepo);

  Future<bool> getCompliance(ComplianceEntity compliance, String id){
    return _complianceRepo.updateCompliance(compliance: compliance, id: id);
  }
}