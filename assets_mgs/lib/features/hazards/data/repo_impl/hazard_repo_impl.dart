
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
  Future<HazardsEntity> addHazard(HazardsEntity hazard) async {
    final response = await remoteHazardDataSource.addHazard(hazard);
    if(response.statusCode == 201){
      List <dynamic> jsonHazards = response.data;

      return HazardModels.fromJson(jsonHazards);
    }
    throw UnimplementedError();
  }


}