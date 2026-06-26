import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/compliance_entity.dart';
import '../../domain/use_cases/get_compliance_case.dart';
import '../../domain/use_cases/update_compliance_case.dart';

part 'compliance_event.dart';
part 'compliance_state.dart';

class ComplianceBloc extends Bloc<ComplianceEvent, ComplianceState> {
  final GetComplianceCase _getComplianceCase;
  final UpdateComplianceCase _updateComplianceCase;
  ComplianceBloc(this._getComplianceCase,this._updateComplianceCase) : super(ComplianceInitial()) {
    on<GetComplianceEvent>(_getCompliance);
    on<AddComplianceEvent>(_addCompliance);
    on<UpdateComplianceEvent>(_updateCompliance);
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

  FutureOr<void> _updateCompliance(UpdateComplianceEvent event, Emitter<ComplianceState> emit)async {


    try{
      final bool isUpdated = await _updateComplianceCase.getCompliance(event.compliance, event.id);
      print('_updateComplianceCase :$isUpdated');
      // Future.delayed(Duration(seconds: 7));
      final compliance = await _getComplianceCase.getCompliance();
      emit(ComplianceLoaded(compliance));
      emit(ComplianceUpdated(isUpdated));
    }catch(e){
      emit(ComplianceMessage('error from: $e'));
    }
  }
}

