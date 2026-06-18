

import '../entities/user_entity.dart';

abstract class AuthRepo {

  Future<UserEntity> registerUser(UserEntity user);
  Future<UserEntity> loginUser(UserEntity user);
}