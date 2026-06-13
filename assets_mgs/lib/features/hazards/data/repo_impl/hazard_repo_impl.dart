
import 'package:assets_mgs/features/hazards/domain/entities/hazards_entity.dart';
import 'package:assets_mgs/features/hazards/domain/repository/hazard_repo.dart';

import '../data_sources/remote_hazard_data_source.dart';
import '../models/hazard_models.dart';

class HazardRepoImpl implements HazardRepo {

  final RemoteHazardDataSource remoteHazardDataSource;

  HazardRepoImpl( this.remoteHazardDataSource);
  @override
  Future<List<HazardsEntity>> getHazard()  async{

    final response = await remoteHazardDataSource.getHazard();
    if(response.statusCode == 200){
     List <dynamic> jsonHazards = response.data;

     return jsonHazards.map((json)=>HazardModels.fromJson(json)).toList();
    }
    // TODO: implement getHazard
    throw UnimplementedError();
  }

  @override
  Future<bool> addHazard(HazardsEntity hazard) async {
    try{
      final hazardModel = HazardModels(
        hazardId: hazard.hazardId,
        assetId: hazard.assetId,
        asset: hazard.asset,
        complianceId: hazard.complianceId,
        hazardTitle: hazard.hazardTitle,
        hazardDescription: hazard.hazardDescription,
        reportedBy: hazard.reportedBy,
        reportedById: hazard.reportedById,
        status: hazard.status,
        createdAt: hazard.createdAt,
      );
      final response = await remoteHazardDataSource.addHazard(hazardModel);
      if(response.statusCode == 201){
        print('ookkkkkk: ${response.data}');
        return true;
      }
      return false;
    } catch(e){
      print('eeeeeeeee: $e');
      throw Exception('error at $e');
    }
  }


}