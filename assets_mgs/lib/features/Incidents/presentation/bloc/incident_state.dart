part of 'incident_bloc.dart';

@immutable
sealed class IncidentState {}

final class IncidentInitial extends IncidentState {}
final class IncidentLoading extends IncidentState {}
final class IncidentLoaded extends IncidentState {
  final List<IncidentEntity> incidents;

  IncidentLoaded(this.incidents);

}
final class IncidentMessage extends IncidentState {
  final String message;

  IncidentMessage(this.message);

}
