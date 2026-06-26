part of 'compliance_bloc.dart';

@immutable
sealed class ComplianceEvent {}

class GetComplianceEvent extends ComplianceEvent{}
class AddComplianceEvent extends ComplianceEvent{}

class UpdateComplianceEvent extends ComplianceEvent{
  final ComplianceEntity compliance;
  final String id;

  UpdateComplianceEvent(this.compliance,this.id);
}