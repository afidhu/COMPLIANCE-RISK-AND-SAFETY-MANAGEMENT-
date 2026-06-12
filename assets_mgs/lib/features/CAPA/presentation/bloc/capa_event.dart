part of 'capa_bloc.dart';

@immutable
sealed class CapaEvent {}

class GetCapaEvent extends CapaEvent{
  final String hazardId;

  GetCapaEvent(this.hazardId);
}

class AddCapaEvent extends CapaEvent{}