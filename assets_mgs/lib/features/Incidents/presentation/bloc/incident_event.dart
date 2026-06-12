part of 'incident_bloc.dart';

@immutable
sealed class IncidentEvent {}

class GetIncidentEvent extends  IncidentEvent{}
class AddIncidentEvent extends  IncidentEvent{}