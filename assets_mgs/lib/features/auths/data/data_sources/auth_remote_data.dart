

import 'package:assets_mgs/core/utils/network/dio_client.dart';
import 'package:dio/dio.dart';

import '../models/users_model.dart';

class AuthRemoteData {
  final dioClient =DioClient();

  Future<Response> registerUser(dynamic user) async{

    try{
      return await dioClient.dio.post('/auth/register',data: user.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
  Future<Response> loginUser(dynamic user) async{
    try{
      return await dioClient.dio.post('/auth/login',data: user.toJson());
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
}