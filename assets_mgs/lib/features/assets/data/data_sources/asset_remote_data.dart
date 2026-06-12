
import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class RemoteAssetsDataSource {
  final dioClient =DioClient();


  Future<Response> getAssets() async{
    try{
      return await dioClient.dio.get('/assets/get');
    } catch(e){
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addAssets(dynamic asset) async{
    try{
      return await dioClient.dio.post('path',data: asset.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}