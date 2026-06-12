import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/capa_entity.dart';
import '../../domain/use_cases/get_capa_case.dart';

part 'capa_event.dart';
part 'capa_state.dart';

class CapaBloc extends Bloc<CapaEvent, CapaState> {
  final GetCapaCase _getCapaCase;
  CapaBloc(this._getCapaCase) : super(CapaInitial()) {
    on<GetCapaEvent>(_getCapa);
    on<AddCapaEvent>(_addCapa);

  }


  FutureOr<void> _getCapa(GetCapaEvent event, Emitter<CapaState> emit) async {
    emit(CapaInitial());
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
}
