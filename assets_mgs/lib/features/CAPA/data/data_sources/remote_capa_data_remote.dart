

import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class RemoteCapaDataRemote {
  final dioClient =DioClient();


  Future<Response> getCapa(String hazardId) async{
    try{
      return await dioClient.dio.get('/capa/get-by-hazardid/$hazardId');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addCapa(dynamic capa) async{
    try{
      return await dioClient.dio.post('path',data: capa.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}