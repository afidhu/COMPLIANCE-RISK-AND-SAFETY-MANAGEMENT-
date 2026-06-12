import 'dart:async';

import 'package:assets_mgs/features/mitigations/domain/use_cases/get_mitigation_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/mitigation_entity.dart';

part 'mitigation_event.dart';
part 'mitigation_state.dart';

class MitigationBloc extends Bloc<MitigationEvent, MitigationState> {
  final GetMitigationCase _getMitigationCase;
  MitigationBloc(this._getMitigationCase) : super(MitigationInitial()) {
    on<GetMitigation>(_getMitigation);
    on<AddMitigation>(_addMitigation);

  }

  FutureOr<void> _getMitigation(GetMitigation event, Emitter<MitigationState> emit) async {
    emit(MitigationLoading());
    try{
      final mitigation = await _getMitigationCase.call(event.hazardId);
      emit(MitigationLoaded(mitigation));
    } catch(e){
      emit(MitigationMessage('message; $e'));
    }
  }

  FutureOr<void> _addMitigation(AddMitigation event, Emitter<MitigationState> emit) async{}
}
