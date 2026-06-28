

import 'package:assets_mgs/features/searchings/domain/entities/search_entity.dart';

import '../../domain/repository/search_repo.dart';
import '../data_sources/search_remote_data.dart';
import '../models/search_model.dart';
class SearchRepoImpl implements SearchRepo{

  final SearchRemoteData _searchRemoteData;

  SearchRepoImpl(this._searchRemoteData);

  @override
  Future<List<SearchEntity>> getSearch() async{
    try{
      final response = await _searchRemoteData.getSearch();
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> searchJson = response.data['data'];
        // print('ComplianceModel ${response.data}');
        return searchJson.map((e)=>SearchModel.fromJson(e)).toList();
      }
      throw Exception('error to get search');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }
}