

import '../../../../core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class NotificationRemoteData {
  final dioClient = DioClient();


  Future<Response> getNotify(String userId) async {
    try {
      return await dioClient.dio.get('/notification/unread/user/${userId.trim()}');
    } catch (e) {
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }
}