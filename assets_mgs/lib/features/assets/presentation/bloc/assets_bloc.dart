import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/assets_entity.dart';
import '../../domain/use_cases/get_assets_case.dart';

part 'assets_event.dart';
part 'assets_state.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final GetAssetsCase _getAssetsCase;
  AssetsBloc(this._getAssetsCase) : super(AssetsInitial()) {
    on<GetAssetEvent>(_getAsset) ;

    on<AddAssetEvent>(_addAsset) ;

  }


  FutureOr<void> _getAsset(GetAssetEvent event, Emitter<AssetsState> emit) async{
    emit(AssetsLoading());
    try{
      final assets = await _getAssetsCase.getAssets();
      print('assets : $assets');
      emit(AssetsLoaded( assets));
    } catch(e){
      emit(AssetsMessage('messageError : $e'));
    }
  }

  FutureOr<void> _addAsset(AddAssetEvent event, Emitter<AssetsState> emit) {}
}
