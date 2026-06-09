import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/hazards_entity.dart';

part 'hazards_event.dart';
part 'hazards_state.dart';

class HazardsBloc extends Bloc<HazardsEvent, HazardsState> {
  HazardsBloc() : super(HazardsInitial()) {

    on<GetHazardsEvent>(_getHazard) ;

  }


  FutureOr<void> _getHazard(GetHazardsEvent event, Emitter<HazardsState> emit) {}
}
