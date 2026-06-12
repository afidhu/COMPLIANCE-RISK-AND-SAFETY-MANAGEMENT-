import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/compliance_entity.dart';
import '../../domain/use_cases/get_compliance_case.dart';

part 'compliance_event.dart';
part 'compliance_state.dart';

class ComplianceBloc extends Bloc<ComplianceEvent, ComplianceState> {
  final GetComplianceCase _getComplianceCase;
  ComplianceBloc(this._getComplianceCase) : super(ComplianceInitial()) {
    on<GetComplianceEvent>(_getCompliance);
    on<AddComplianceEvent>(_addCompliance);
  }

  FutureOr<void> _getCompliance(GetComplianceEvent event, Emitter<ComplianceState> emit) async {
    try{
      final compliance = await _getComplianceCase.getCompliance();
      emit(ComplianceLoaded(compliance));
    }catch(e){
      emit(ComplianceMessage('error from: $e'));
    }
  }

  FutureOr<void> _addCompliance(AddComplianceEvent event, Emitter<ComplianceState> emit) {}
}

