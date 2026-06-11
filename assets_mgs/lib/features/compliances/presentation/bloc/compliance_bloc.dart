import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'compliance_event.dart';
part 'compliance_state.dart';

class ComplianceBloc extends Bloc<ComplianceEvent, ComplianceState> {
  ComplianceBloc() : super(ComplianceInitial()) {
    on<ComplianceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
