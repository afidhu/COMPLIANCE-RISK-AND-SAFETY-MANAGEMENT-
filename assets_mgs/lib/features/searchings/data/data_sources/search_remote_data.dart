


import '../../../../core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class SearchRemoteData {
  final _dioClient = DioClient();


  Future<Response> getSearch() async {
    try {
      return await _dioClient.dio.get('/search/all-assets-risks-incidents');
    } catch (e) {
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

}