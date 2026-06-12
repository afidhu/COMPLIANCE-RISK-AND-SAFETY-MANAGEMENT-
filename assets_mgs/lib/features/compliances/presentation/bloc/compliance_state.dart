part of 'compliance_bloc.dart';

@immutable
sealed class ComplianceState {}

 class ComplianceInitial extends ComplianceState {}
 class ComplianceLoading extends ComplianceState {}
 class ComplianceMessage extends ComplianceState {
  final String message;
  ComplianceMessage(this.message);
 }
class ComplianceLoaded extends ComplianceState {
  final List<ComplianceEntity> compliance;

  ComplianceLoaded(this.compliance);
}
