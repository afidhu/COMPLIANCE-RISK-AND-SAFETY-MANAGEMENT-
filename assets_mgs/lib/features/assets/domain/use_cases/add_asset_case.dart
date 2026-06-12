

import '../entities/assets_entity.dart';
import '../repository/assets_repo.dart';

class AddAssetCase {
  final AssetsRepo assetsRepo;

  AddAssetCase({required this.assetsRepo});
  Future<bool> addAsset(AssetsEntity assets) async{
    return assetsRepo.addAsset(assets);
  }
}