part of 'capa_bloc.dart';

@immutable
sealed class CapaState {}

final class CapaInitial extends CapaState {}
 class CapaLoading extends CapaState {}
 class CapaLoaded extends CapaState {
  final List<CapaEntity> capas;

  CapaLoaded(this.capas);
 }
 class CapaMessage extends CapaState {
  final String message;

  CapaMessage(this.message);
 }

 class UpdatedTechnicianCapaStatus extends CapaState {
  final bool isUpdated;

  UpdatedTechnicianCapaStatus(this.isUpdated);


 }

