part of 'hazards_bloc.dart';

@immutable
sealed class HazardsEvent {}

class GetHazardsEvent extends HazardsEvent{}
class AddHazardsEvent extends HazardsEvent{
  final HazardsEntity hazardsEntity;

  AddHazardsEvent(this.hazardsEntity);
}