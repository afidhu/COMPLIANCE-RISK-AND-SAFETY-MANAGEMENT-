

import 'package:assets_mgs/features/auths/domain/entities/user_entity.dart';

import '../../domain/repository/auth_repo.dart';
import '../data_sources/auth_remote_data.dart';
import '../models/users_model.dart';

class AuthRepoImpl  implements AuthRepo{
  final AuthRemoteData _authRemoteData;

  AuthRepoImpl(this._authRemoteData);
  @override
  Future<UserEntity> loginUser(UserEntity user) async{
    final usersModel =UsersModel.fromEntity(user);
    try{
      final response = await _authRemoteData.loginUser(usersModel);
      print('response_, ${response.statusCode}');
      if(response.statusCode ==200 || response.statusCode ==2001){
        final userJson = response.data;
        return UsersModel.fromJson(userJson);
      }else{
        throw Exception('Fail to Login User');
      }
    } catch(e){
      throw Exception('Error at : $e');
    }
  }

  @override
  Future<UserEntity> registerUser(UserEntity user) async{
    final usersModel =UsersModel.fromEntity(user);
    try{
      final response = await _authRemoteData.registerUser(usersModel);
      if(response.statusCode ==201 || response.statusCode == 200 ){
        final userJson = response.data;
        return UsersModel.fromJson(userJson);
      }else{
        throw Exception('Fail to Register User');
      }
    } catch(e){
      throw Exception('Error at : $e');
    }
  }
  
}