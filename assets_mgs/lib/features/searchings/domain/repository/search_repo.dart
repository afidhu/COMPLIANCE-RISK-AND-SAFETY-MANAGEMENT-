

import '../entities/search_entity.dart';

abstract class SearchRepo {

  Future<List<SearchEntity>> getSearch();
}