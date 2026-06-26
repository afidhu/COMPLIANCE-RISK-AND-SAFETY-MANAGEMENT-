
import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class ComplianceRemoteDataSource {
  final dioClient =DioClient();


  Future<Response> getCompliance() async{
    try{
      return await dioClient.dio.get('/compliance/get');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addCompliance(dynamic compliance) async{
    try{
      return await dioClient.dio.post('path',data: compliance.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }

  Future<Response> updateCompliance(dynamic compliance, dynamic id) async{
    try{
      return await dioClient.dio.put('/compliance/update/$id',data: compliance.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}