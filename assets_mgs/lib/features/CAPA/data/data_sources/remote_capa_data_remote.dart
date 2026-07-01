

import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class RemoteCapaDataRemote {
  final _dioClient =DioClient();


  Future<Response> getCapa(String hazardId) async{
    try{
      return await _dioClient.dio.get('/capa/get-by-hazardid/$hazardId');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> getCapaByTechnician(String userId) async{
    try{
      return await _dioClient.dio.get('/capa/get-by-userid/$userId');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }
  Future<Response> updateCapaByTechnician(String capaId,capa ) async{
    try{
      return await _dioClient.dio.put('/capa/update/$capaId', data:capa.toJson());
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addCapa(dynamic capa) async{
    try{
      return await _dioClient.dio.post('path',data: capa.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }

  Future<Response> getCompleteApprovedCapa(String userId) async{
    try{
      return await _dioClient.dio.get('/capa/get-completed-approved/$userId');
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}