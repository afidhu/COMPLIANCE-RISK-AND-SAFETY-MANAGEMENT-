part of 'risks_bloc.dart';

@immutable
sealed class RisksState {}

final class RisksInitial extends RisksState {}
final class RisksLoading extends RisksState {}
final class RisksMessage extends RisksState {
  final String message;

  RisksMessage(this.message);
}
final class RisksLoaded extends RisksState {
  final List<RiskEntity> risks;

  RisksLoaded(this.risks);
}
