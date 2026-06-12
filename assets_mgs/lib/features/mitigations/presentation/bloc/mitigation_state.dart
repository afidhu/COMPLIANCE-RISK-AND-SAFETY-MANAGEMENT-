part of 'mitigation_bloc.dart';

@immutable
sealed class MitigationState {}

final class MitigationInitial extends MitigationState {}
 class MitigationLoading extends MitigationState {}
 class MitigationLoaded extends MitigationState {
  final List<MitigationEntity> mitigation;

  MitigationLoaded(this.mitigation);
 }
 class MitigationMessage extends MitigationState {
  final String message;

  MitigationMessage(this.message);

 }
