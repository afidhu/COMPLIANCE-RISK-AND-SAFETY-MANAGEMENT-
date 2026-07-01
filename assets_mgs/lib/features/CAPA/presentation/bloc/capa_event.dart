part of 'capa_bloc.dart';

@immutable
sealed class CapaEvent {}

class GetCapaEvent extends CapaEvent{
  final String hazardId;

  GetCapaEvent(this.hazardId);
}
class GetCapaByTechnicianEvent extends CapaEvent{}

class GetCompletedApprovedCapaByTechnicianEvent extends CapaEvent{}

class AddCapaEvent extends CapaEvent{}

class UpdateCapaByTechnicianEvent extends CapaEvent{
  final String capaId;
  final CapaEntity capa;

  UpdateCapaByTechnicianEvent({required this.capaId, required this.capa});
}