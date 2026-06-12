
import 'package:assets_mgs/features/CAPA/domain/entities/capa_entity.dart';

import '../../domain/repository/capa_repo.dart';
import '../data_sources/remote_capa_data_remote.dart';
import '../models/capa_model.dart';

class CapaRepoImpl extends CapaRepo{
  final RemoteCapaDataRemote remoteCapaDataRemote;

  CapaRepoImpl(this.remoteCapaDataRemote);
  @override
  Future<bool> addCapa(capa) async{
    try{
      final resp = await remoteCapaDataRemote.addCapa(capa);
      if(resp.statusCode ==201){
        return true;
      }
      return false;
    } catch(e) {
      print('error at : $e');
      // TODO: implement addAsset
      throw Exception('eror at :$e');
    }
  }

  @override
  Future<List<CapaEntity>> getCapa(String hazardId) async {
    try{
      final response = await remoteCapaDataRemote.getCapa(hazardId);
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>CapaModel.fromJson(e)).toList();
      }
      throw Exception('error to get capa');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

}