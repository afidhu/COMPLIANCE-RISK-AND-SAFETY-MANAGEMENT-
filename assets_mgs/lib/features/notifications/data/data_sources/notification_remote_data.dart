

import '../../../../core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

class NotificationRemoteData {
  final dioClient = DioClient();


  Future<Response> getNotify(String userId) async {
    try {
      return await dioClient.dio.get('/notifications/user/${userId.trim()}');

    } catch (e) {
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }

  //update as read

  Future<Response> readNotify(String notId) async {
    try {
      return await dioClient.dio.patch('/notifications/${notId.trim()}',data: {"is_read":true});

    } catch (e) {
      print('eror : ${e.toString()}');
      throw Exception('Error at : $e');
    }
  }
}