

import 'package:assets_mgs/features/Incidents/domain/entities/incident_entity.dart';

import '../../domain/repository/incident_repo.dart';
import '../data_sources/incident_remote_data.dart';
import '../models/incident_model.dart';

class IncidentRepoImpl implements IncidentRepo {
  final IncidentRemoteData incidentRemoteData;

  IncidentRepoImpl(this.incidentRemoteData);
  @override
  Future<bool> addIncident(IncidentEntity incident)async {
    try{
      final resp = await incidentRemoteData.addIncident(incident);
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
  Future<List<IncidentEntity>> getIncident()async {
    try{
      final response = await incidentRemoteData.getIncident();
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>IncidentModel.fromJson(e)).toList();
      }
      throw Exception('error to get incident');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

}