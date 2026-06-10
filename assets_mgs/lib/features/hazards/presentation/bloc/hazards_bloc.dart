import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/hazards_entity.dart';
import '../../domain/use_cases/get_hazards_case.dart';

part 'hazards_event.dart';
part 'hazards_state.dart';

class HazardsBloc extends Bloc<HazardsEvent, HazardsState> {
  final GetHazardsCase _getHazardsCase;
  HazardsBloc(this._getHazardsCase) : super(HazardsInitial()) {

    on<GetHazardsEvent>(_getHazard) ;
    on<AddHazardsEvent>(_addHazard) ;

  }


  FutureOr<void> _getHazard(GetHazardsEvent event, Emitter<HazardsState> emit) async {
    print('HazardsBloc_fine');
    emit(HazardsLoading());
    try {
      final hazard = await _getHazardsCase.call();
      print('hazard; ${hazard.first}');
      emit(HazardsLoaded(hazards: hazard));
    } catch(e){
      emit(HazardsError('errorMessage : $e'));
    }
  }




  FutureOr<void> _addHazard(AddHazardsEvent event, Emitter<HazardsState> emit) {}
}
