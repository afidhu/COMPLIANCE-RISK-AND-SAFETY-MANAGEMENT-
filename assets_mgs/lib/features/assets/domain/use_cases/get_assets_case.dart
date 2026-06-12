
import '../entities/assets_entity.dart';
import '../repository/assets_repo.dart';

class GetAssetsCase {
  final AssetsRepo assetsRepo;


  GetAssetsCase( this.assetsRepo);

  Future<List<AssetsEntity>> getAssets() async{
    return assetsRepo.getAsset();
  }

}