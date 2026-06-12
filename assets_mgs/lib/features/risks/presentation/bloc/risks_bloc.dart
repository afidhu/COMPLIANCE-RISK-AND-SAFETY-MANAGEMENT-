import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/risk_entity.dart';
import '../../domain/use_cases/get_all_risk_case.dart';
import '../../domain/use_cases/get_risk_case.dart';

part 'risks_event.dart';
part 'risks_state.dart';

class RisksBloc extends Bloc<RisksEvent, RisksState> {
  final GetRiskCase _getRiskCase;
  final GetAllRiskCase _allRiskCase;
  RisksBloc(this._getRiskCase, this._allRiskCase) : super(RisksInitial()) {
    on<GetRiskEvent>(_getRisk) ;
    on<AddRiskEvent>(_addRisk) ;
    on<GetRiskAllEvent>(_addAllRisk) ;
  }


  FutureOr<void> _getRisk(GetRiskEvent event, Emitter<RisksState> emit)async {
    emit(RisksLoading());
    try{
      final risks = await _getRiskCase.call(event.hazardId);
      emit(RisksLoaded(risks));
    } catch(e){
      emit(RisksMessage('message : $e'));
    }
  }

  FutureOr<void> _addRisk(AddRiskEvent event, Emitter<RisksState> emit)async {}

  FutureOr<void> _addAllRisk(GetRiskAllEvent event, Emitter<RisksState> emit) async{
    emit(RisksLoading());
    try{
      final risks = await _allRiskCase.call();
      emit(RisksLoaded(risks));
    } catch(e){
      emit(RisksMessage('message : $e'));
    }
  }
}
