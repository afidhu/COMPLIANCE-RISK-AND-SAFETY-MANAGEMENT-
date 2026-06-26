

import '../../domain/entities/compliance_entity.dart';
import '../../domain/repository/compliance_repo.dart';
import '../data_sources/compliance_remote_data_source.dart';
import '../models/compliance.dart';

class ComplianceRepoImpl implements ComplianceRepo  {

  final ComplianceRemoteDataSource complianceRemoteDataSource;

  ComplianceRepoImpl(this.complianceRemoteDataSource);
  @override
  Future<bool> addCompliance(ComplianceEntity compliance) async{
    try{
      final resp = await complianceRemoteDataSource.addCompliance(compliance);
      if(resp.statusCode ==201){
        return true;
      }
      return false;
    } catch(e) {
      // TODO: implement addAsset
      throw Exception('eror at :$e');
    }
  }


  @override
  Future<List<ComplianceEntity>> getCompliance()  async{

    try{
      final response = await complianceRemoteDataSource.getCompliance();
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> assetJson = response.data;
        // print('ComplianceModel ${response.data}');
        return assetJson.map((e)=>ComplianceModel.fromJson(e)).toList();
      }
      throw Exception('error to get Asset');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }

  @override
  Future<bool> updateCompliance({required ComplianceEntity compliance, required String id}) async{
    try{
      final complianceModel =ComplianceModel.fromEntity(compliance);
      final response = await complianceRemoteDataSource.updateCompliance(complianceModel, id);
      if(response.statusCode == 200 || response.statusCode ==201){
        return true;
      }
      throw Exception('error to update compliance');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }
  }

