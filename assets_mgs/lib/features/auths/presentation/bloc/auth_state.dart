part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}
class AuthMessage extends AuthState {
  final String message;

  AuthMessage(this.message);
}
class AuthLoginSuccess extends AuthState {
  final String message;
  final UserEntity user;

  AuthLoginSuccess(this.message,{required this.user});
}

class IsClickedAuthButton extends AuthState{
  final bool isClicked;

  IsClickedAuthButton({this.isClicked =false});

}

class AuthLogoutMessage extends AuthState {
  final String message;

  AuthLogoutMessage(this.message);
}
class AuthRegisterSuccess extends AuthState {
  final String message;

  AuthRegisterSuccess(this.message);
}