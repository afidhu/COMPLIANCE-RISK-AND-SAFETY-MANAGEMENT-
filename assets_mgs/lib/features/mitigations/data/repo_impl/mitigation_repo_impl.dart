

import 'package:assets_mgs/features/mitigations/domain/entities/mitigation_entity.dart';

import '../../domain/repository/mitigation_repo.dart';
import '../data_sources/mitigation_remote_data.dart';
import '../models/mitigation_model.dart';

class MitigationRepoImpl  implements MitigationRepo{
  final MitigationRemoteData mitigationRemoteData;

  MitigationRepoImpl(this.mitigationRemoteData);

  @override
  Future<List<MitigationEntity>> getMitigation(String hazardId) async {
    try{
      final response = await mitigationRemoteData.getMitigation(hazardId);
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>MitigationModel.fromJson(e)).toList();
      }
      throw Exception('error to get mit');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

  @override
  Future<bool> addMitigation(MitigationEntity mitigation) async{
    try{
      final resp = await mitigationRemoteData.addMitigation(mitigation);
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
  }

