import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/capa_entity.dart';
import '../../domain/use_cases/get_capa_by_technician.dart';
import '../../domain/use_cases/get_capa_case.dart';
import '../../domain/use_cases/update_capa_technician.dart';

part 'capa_event.dart';
part 'capa_state.dart';

class CapaBloc extends Bloc<CapaEvent, CapaState> {
  final GetCapaCase _getCapaCase;
  final GetCapaByTechnician _capaByTechnician;
  final UpdateCapaTechnicianCase _updateCapaTechnicianCase;
  CapaBloc(this._getCapaCase,this._capaByTechnician,this._updateCapaTechnicianCase) : super(CapaInitial()) {
    on<GetCapaEvent>(_getCapa);
    on<GetCapaByTechnicianEvent>(_getCapaByTechnician);
    on<AddCapaEvent>(_addCapa);
    on<UpdateCapaByTechnicianEvent>(_updateCapaByTechnician);

  }


  FutureOr<void> _getCapa(GetCapaEvent event, Emitter<CapaState> emit) async {
    emit(CapaLoading());
    try{
      final capa = await _getCapaCase.call(event.hazardId);
      print('bloc_capa: $capa');
      emit(CapaLoaded(capa));
    } catch(e){
      print('bloc_capa_error');
      emit(CapaMessage('message: $e'));
    }
  }

  FutureOr<void> _addCapa(AddCapaEvent event, Emitter<CapaState> emit)async {}

  FutureOr<void> _getCapaByTechnician(GetCapaByTechnicianEvent event, Emitter<CapaState> emit) async{
    emit((CapaLoading()));
    try{
      final capa = await _capaByTechnician.call(event.userId);
      print('bloc_capa: $capa');
      emit(CapaLoaded(capa));
    } catch(e){
      print('bloc_capa_error');
      emit(CapaMessage('message: $e'));
    }
  }

  FutureOr<bool> _updateCapaByTechnician(UpdateCapaByTechnicianEvent event, Emitter<CapaState> emit) async{
    try{
      final isUpdated = await _updateCapaTechnicianCase.call(capaId: event.capaId, capa: event.capa);
      print('bloc_capaStatus: $isUpdated');

      if(isUpdated){
        final capa = await _capaByTechnician.call('cmq3r9t6n0000rte28j0zvojs');
        emit(CapaLoaded(capa));
        return true;
      }
      else{
        return false;
      }
      // if(isUpdated == true){
      //   emit(UpdatedTechnicianCapaStatus(isUpdated));
      // }
    } catch(e){
      print('bloc_capa_error');
      emit(CapaMessage('message: $e'));
      return false;
    }
  }
}
