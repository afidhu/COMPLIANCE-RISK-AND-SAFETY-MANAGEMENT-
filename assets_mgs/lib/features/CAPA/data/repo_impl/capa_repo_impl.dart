
import 'package:assets_mgs/features/CAPA/domain/entities/capa_entity.dart';

import '../../domain/repository/capa_repo.dart';
import '../data_sources/remote_capa_data_remote.dart';
import '../models/capa_model.dart';

class CapaRepoImpl extends CapaRepo{
  final RemoteCapaDataRemote _remoteCapaDataRemote;

  CapaRepoImpl(this._remoteCapaDataRemote);
  @override
  Future<bool> addCapa(capa) async{
    try{
      final resp = await _remoteCapaDataRemote.addCapa(capa);
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
      final response = await _remoteCapaDataRemote.getCapa(hazardId);
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

  @override
  Future<List<CapaEntity>> getCapaByTechnician(String userId)async {
    try{
      final response = await _remoteCapaDataRemote.getCapaByTechnician(userId);
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

  @override
  Future<bool> updateCapaByTechnician({required String capaId, required CapaEntity capa}) async {
    try{

      final capaModel =CapaModel(
        status: capa.status
      );

      final response = await _remoteCapaDataRemote.updateCapaByTechnician(capaId, capaModel);
      if(response.statusCode == 200 || response.statusCode ==201){
       return true;
      }
      return  false;
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

  @override
  Future<List<CapaEntity>> getCompletedApprovedCapaByTechnician(String userId) async{
    try{
      final response = await _remoteCapaDataRemote.getCompleteApprovedCapa(userId);
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>CapaModel.fromJson(e)).toList();
      }
      throw Exception('error to getCompleteApprovedCapa capa');
    } catch(e){
    print('error at : $e');
    throw Exception(' error $e');
    }
  }

}