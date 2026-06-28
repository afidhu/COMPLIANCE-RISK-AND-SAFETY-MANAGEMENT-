import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/use_cases/get_search_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchCase _getSearchCase;
  SearchCubit(this._getSearchCase) : super(SearchInitial());


  Future<void> getAllSearch() async{
    emit(SearchLoading());
    try{
      final results = await _getSearchCase.call();
      print('results : $results');
      emit(SearchLoaded(results));
    } catch(e){
      print("_getSearchCase : $e");
      emit(SearchError('fail to search..'));
      throw Exception('Fail to get search error : $e');
    }
  }
}
