

import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class IncidentRemoteData {
  final dioClient =DioClient();


  Future<Response> getIncident() async{
    try{
      return await dioClient.dio.get('/incidents/get');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addIncident(dynamic incident) async{
    try{
      return await dioClient.dio.post('path',data: incident.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}