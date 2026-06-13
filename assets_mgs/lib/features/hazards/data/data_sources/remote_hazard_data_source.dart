

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';

import '../../../../core/utils/network/dio_client.dart';
import '../models/hazard_models.dart';

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
      print('hhhhhhhhhhhhhhhhhh, $hazard');
      return await dioClient.dio.post('/hazards/add',data: hazard.toJson(), options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),);
    }on DioException catch (e) {
      print("ERROR TYPE: ${e.type}");
      print("MESSAGE: ${e.message}");
      print("RESPONSE: ${e.response?.data}");
      throw Exception('Error at the: $e');
    }
  }
}