import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/incident_entity.dart';
import '../../domain/use_cases/get_incident_case.dart';

part 'incident_event.dart';
part 'incident_state.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  final GetIncidentCase _getIncidentCase;
  IncidentBloc(this._getIncidentCase) : super(IncidentInitial()) {
    on<GetIncidentEvent>(_getIncident) ;
    on<AddIncidentEvent>(_addIncident) ;
  }


  FutureOr<void> _getIncident(GetIncidentEvent event, Emitter<IncidentState> emit) async{
    emit(IncidentLoading());
    try{
      final incidents = await _getIncidentCase.call();
      emit(IncidentLoaded(incidents));
    } catch(e){
      emit(IncidentMessage('message : $e'));
    }
  }

  FutureOr<void> _addIncident(AddIncidentEvent event, Emitter<IncidentState> emit) {}
}
