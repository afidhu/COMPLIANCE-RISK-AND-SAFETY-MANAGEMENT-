

import '../entities/user_entity.dart';
import '../repository/auth_repo.dart';

class LoginCase {

  final AuthRepo authRepo;

  LoginCase(this.authRepo);
  Future<UserEntity> call(UserEntity user){
    return authRepo.loginUser(user);
  }
}