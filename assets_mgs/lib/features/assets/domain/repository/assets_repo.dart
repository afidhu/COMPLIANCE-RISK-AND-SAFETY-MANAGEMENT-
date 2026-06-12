

import '../entities/assets_entity.dart';

abstract class AssetsRepo {

  Future<List<AssetsEntity>> getAsset();
  Future<bool> addAsset(AssetsEntity assets);
}