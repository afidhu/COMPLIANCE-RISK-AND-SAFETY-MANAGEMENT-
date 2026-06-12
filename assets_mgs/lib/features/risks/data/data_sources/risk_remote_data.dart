
import '../../../../core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class RiskRemoteData {
  final dioClient = DioClient();


  Future<Response> getRisk(String hazardId) async {
    try {
      return await dioClient.dio.get('/risks/get-by-hazard/${hazardId.trim()}');
    } catch (e) {
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  Future<Response> addRisk(dynamic risk) async {
    try {
      return await dioClient.dio.post('path', data: risk.toJson());
    } catch (e) {
      throw Exception('Error at : $e');
    }
  }
}