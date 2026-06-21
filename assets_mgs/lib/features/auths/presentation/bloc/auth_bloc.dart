import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../../domain/use_cases/login_case.dart';
import '../../domain/use_cases/register_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginCase _loginCase;
  final RegisterCase _registerCase;
  AuthBloc(this._loginCase,this._registerCase) : super(AuthInitial()) {
    on<RegisterUserEvent>(_registerUser);
    on<LoginUserEvent>(_loginUser);
    // on<LogoutUserEvent>(_logoutUser);
  }


  FutureOr<void> _registerUser(RegisterUserEvent event, Emitter<AuthState> emit) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
 emit(IsClickedAuthButton(isClicked: true));
    try{
      final addUser = await _registerCase.call(event.user);
      if(addUser.userId!.isNotEmpty){
        prefs.clear();
        emit(AuthRegisterSuccess('Successful'));
        print('User added_success:$addUser');
        emit(IsClickedAuthButton(isClicked: false));
      }
    }catch(e){
      emit(IsClickedAuthButton(isClicked: false));
      print('User added_Error:$e');
      emit(AuthMessage('Fail to Create account: $e'));
    }
  }

  FutureOr<void> _loginUser(LoginUserEvent event, Emitter<AuthState> emit)async {
    emit(IsClickedAuthButton(isClicked: true));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // emit(AuthLoading());
    try{

      final loginUser = await _loginCase.call(event.user);
      print('User loginUser :$loginUser');
      if(loginUser.userId!.isNotEmpty){
        print('User added_success');
        await prefs.setString('email', loginUser.email.toString());
        await prefs.setString('userId', loginUser.userId.toString());
        await prefs.setString('userType', loginUser.role.toString());
        emit(AuthLoginSuccess('success Login',user: loginUser));
        Timer(Duration(milliseconds: 20), (){
          emit(IsClickedAuthButton(isClicked: false));
        });

      }
      else{
        emit(AuthMessage('Fail to Login'));
      }
    }catch(e){
      emit(IsClickedAuthButton(isClicked: false));
      emit(AuthMessage('message: $e'));
    }
  }


}
