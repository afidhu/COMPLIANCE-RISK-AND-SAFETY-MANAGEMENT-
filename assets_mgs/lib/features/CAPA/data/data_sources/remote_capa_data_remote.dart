

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

  Future<Response> updateCapaByTechnician(String capaId, dynamic capa) async {
    try {
      print('capaDATA: $capa');

      // 1. Get the standard json map from your model
      Map<String, dynamic> dataMap = capa.toJson();

      // 2. Intercept and replace the raw File object with a MultipartFile stream
      if (capa.imageFile != null) {
        dataMap['file'] = await MultipartFile.fromFile(
          capa.imageFile!.path,
          filename: capa.imageFile!.path.split('/').last,
        );
      } else {
        // Remove it from the map if no file exists so you don't send a null string
        dataMap.remove('file');
      }

      // 3. Convert the map (now containing the binary stream) into FormData
      FormData payload = FormData.fromMap(dataMap);

      // 4. Send to Node.js
      return await _dioClient.dio.put('/capa/update/$capaId', data: payload);
    } catch(e) {
      print('error : ${e.toString()}');
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