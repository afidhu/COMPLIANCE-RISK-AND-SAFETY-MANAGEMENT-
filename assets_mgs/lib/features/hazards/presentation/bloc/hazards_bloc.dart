import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/hazards_entity.dart';
import '../../domain/use_cases/add_hazards_case.dart';
import '../../domain/use_cases/get_hazards_case.dart';

part 'hazards_event.dart';
part 'hazards_state.dart';

class HazardsBloc extends Bloc<HazardsEvent, HazardsState> {
  final GetHazardsCase _getHazardsCase;
  final AddHazardsCase _addHazardsCase;
  HazardsBloc(this._getHazardsCase,this._addHazardsCase) : super(HazardsInitial()) {

    on<GetHazardsEvent>(_getHazard) ;
    on<AddHazardsEvent>(_addHazard) ;
  }


  FutureOr<void> _getHazard(GetHazardsEvent event, Emitter<HazardsState> emit) async {
    emit(HazardsLoading());
    try {
      final hazard = await _getHazardsCase.call();
      emit(HazardsLoaded(hazards: hazard,true));
    } catch(e){
      emit(HazardsError('errorMessage : $e'));
    }
  }




  FutureOr<void> _addHazard(AddHazardsEvent event, Emitter<HazardsState> emit) async{
    print('event.hazardsEntity : ${event.hazardsEntity}');
    emit(IsHazardsAddedButtonClicked(true));
    try {
      bool status = await _addHazardsCase.call(event.hazardsEntity);
      emit(IsHazardsAddedButtonClicked(false));
      if(status){
        // print('HazardsAddedSuccess; $status');
        // emit(HazardsAddedSuccess(true ));
        final hazard = await _getHazardsCase.call();
        emit(HazardsLoaded(hazards: hazard,true));
        // emit(HazardsAddedSuccess(true));
        // Get.back();
      }
    } catch(e){
      emit(HazardsError('errorMessage : $e'));
    }
  }
}
