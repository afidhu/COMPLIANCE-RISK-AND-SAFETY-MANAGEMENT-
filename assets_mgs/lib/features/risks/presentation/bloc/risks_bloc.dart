import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/risk_entity.dart';
import '../../domain/use_cases/get_risk_case.dart';

part 'risks_event.dart';
part 'risks_state.dart';

class RisksBloc extends Bloc<RisksEvent, RisksState> {
  final GetRiskCase _getRiskCase;
  RisksBloc(this._getRiskCase) : super(RisksInitial()) {
    on<GetRiskEvent>(_getRisk) ;
    on<AddRiskEvent>(_addRisk) ;
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
}
