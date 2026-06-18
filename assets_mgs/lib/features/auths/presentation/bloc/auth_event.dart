part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterUserEvent extends AuthEvent{
  final UserEntity user;

  RegisterUserEvent(this.user);

}

class LoginUserEvent extends AuthEvent{
  final UserEntity user;

  LoginUserEvent(this.user);

}

