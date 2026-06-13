
import 'package:assets_mgs/features/risks/domain/entities/risk_entity.dart';

import '../../domain/repository/risk_repo.dart';
import '../data_sources/risk_remote_data.dart';
import '../models/risks_model.dart';

class RiskRepoImpl implements RiskRepo  {

  final RiskRemoteData remoteData;

  RiskRepoImpl(this.remoteData);

  @override
  Future<bool> addRisk(RiskEntity risk) async{
    try{
      final risksModel =RisksModel(
        hazardId: risk.hazardId,
        riskDescription: risk.riskDescription,
        riskTitle: risk.riskTitle,
        severity:risk.severity,
      );
      final resp = await remoteData.addRisk(risksModel);
      if(resp.statusCode ==201){
        return true;
      }
      return false;
    } catch(e) {
      print(' ok_ok : $e');
      throw Exception('eror at :$e');
    }
  }

  @override
  Future<List<RiskEntity>> getRisk(String hazardId) async{
    try{
      final response = await remoteData.getRisk(hazardId);
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>RisksModel.fromJson(e)).toList();
      }
      throw Exception('error to get risk');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

  @override
  Future<List<RiskEntity>> getAllRisk()  async{
    try{
      final response = await remoteData.getAllRisk();
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>RisksModel.fromJson(e)).toList();
      }
      throw Exception('error to get risk');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

}
