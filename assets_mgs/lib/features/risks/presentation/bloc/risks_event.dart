part of 'risks_bloc.dart';

@immutable
sealed class RisksEvent {}

class GetRiskEvent extends RisksEvent{
  final String hazardId;

  GetRiskEvent(this.hazardId);
}
class AddRiskEvent extends RisksEvent{
  final RiskEntity risk;

  AddRiskEvent(this.risk);
}