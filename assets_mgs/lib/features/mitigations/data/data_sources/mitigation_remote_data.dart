


import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class MitigationRemoteData {
  final dioClient =DioClient();


  Future<Response> getMitigation(String hazardId) async{
    try{
      return await dioClient.dio.get('/mitigations/get-by-hazardid/$hazardId');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addMitigation(dynamic mitigation) async{
    try{
      return await dioClient.dio.post('path',data: mitigation.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}