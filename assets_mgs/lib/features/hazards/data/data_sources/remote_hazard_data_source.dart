

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';

import '../../../../core/utils/network/dio_client.dart';

class RemoteHazardDataSource {
    final dioClient =DioClient();


  Future<Response> getHazard() async{
    try{
      return await dioClient.dio.get('/hazards/get');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addHazard(dynamic hazard) async{
    try{
      return await dioClient.dio.post('path',data: hazard.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}