part of 'hazards_bloc.dart';

@immutable
sealed class HazardsEvent {}

class GetHazardsEvent extends HazardsEvent{}