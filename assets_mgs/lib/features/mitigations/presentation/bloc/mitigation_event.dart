part of 'mitigation_bloc.dart';

@immutable
sealed class MitigationEvent {}

class GetMitigation extends MitigationEvent{
  final String hazardId;

  GetMitigation(this.hazardId);
}

class AddMitigation extends MitigationEvent{}