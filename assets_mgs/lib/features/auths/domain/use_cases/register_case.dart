

import '../entities/user_entity.dart';
import '../repository/auth_repo.dart';

class RegisterCase {
  final AuthRepo authRepo;

  RegisterCase(this.authRepo);

  Future<UserEntity> call(UserEntity user){

    return authRepo.registerUser(user);
  }
}