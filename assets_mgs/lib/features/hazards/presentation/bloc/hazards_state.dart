part of 'hazards_bloc.dart';

@immutable
sealed class HazardsState {}

final class HazardsInitial extends HazardsState {}

// class HazardsInitial extends HazardsState{}
class HazardsLoading extends HazardsState{}
// class HazardsAddedSuccess extends HazardsState{
//   final bool isAdded;
//
//   HazardsAddedSuccess(this.isAdded);
//
// }
class HazardsError extends HazardsState{
  final String errorMessage;

  HazardsError(this.errorMessage);
}
class HazardsLoaded extends HazardsState{
  final bool isAdded;
  final List<HazardsEntity> hazards;

  HazardsLoaded(this.isAdded,{required this.hazards});

}

class IsHazardsAddedButtonClicked extends HazardsState{
  final bool isClicked;

  IsHazardsAddedButtonClicked(this.isClicked);

}