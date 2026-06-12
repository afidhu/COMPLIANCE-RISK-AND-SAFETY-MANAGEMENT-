

import 'package:assets_mgs/features/assets/data/models/assets_model.dart';
import 'package:assets_mgs/features/assets/domain/entities/assets_entity.dart';
import 'package:assets_mgs/features/assets/domain/repository/assets_repo.dart';

import '../data_sources/asset_remote_data.dart';

class AssetsRepoImpl implements AssetsRepo  {

  final RemoteAssetsDataSource remoteAssetsDataSource;

  AssetsRepoImpl(this.remoteAssetsDataSource);
  @override
  Future<bool> addAsset(AssetsEntity assets) async{
    try{
      final resp = await remoteAssetsDataSource.addAssets(assets);
      if(resp.statusCode ==201){
        return true;
      }
      return false;
    } catch(e) {
      print('error at : $e');
      throw Exception('eror at :$e');
    }
  }

  @override
  Future<List<AssetsEntity>> getAsset()  async{

    try{
      final response = await remoteAssetsDataSource.getAssets();
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>AssetsModel.fromJson(e)).toList();
      }
      throw Exception('error to get Asset');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

}