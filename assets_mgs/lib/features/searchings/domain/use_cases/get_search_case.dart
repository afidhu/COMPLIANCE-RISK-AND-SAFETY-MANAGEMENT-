

import 'package:assets_mgs/features/searchings/domain/repository/search_repo.dart';

import '../entities/search_entity.dart';

class GetSearchCase {
  final SearchRepo _searchRepo;

  GetSearchCase(this._searchRepo);

  Future<List<SearchEntity>> call(){
    return _searchRepo.getSearch();
  }
}