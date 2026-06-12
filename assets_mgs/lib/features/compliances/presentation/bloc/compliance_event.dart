part of 'compliance_bloc.dart';

@immutable
sealed class ComplianceEvent {}

class GetComplianceEvent extends ComplianceEvent{}
class AddComplianceEvent extends ComplianceEvent{}