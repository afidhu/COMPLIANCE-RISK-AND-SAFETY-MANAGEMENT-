import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../../domain/use_cases/login_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginCase _loginCase;
  AuthBloc(this._loginCase) : super(AuthInitial()) {
    on<RegisterUserEvent>(_registerUser);
    on<LoginUserEvent>(_loginUser);
  }


  FutureOr<void> _registerUser(RegisterUserEvent event, Emitter<AuthState> emit) async{
    try{
      // final addUser = await r.call(event.user);
      // if(addUser.phone!.isNotEmpty){
      //   print('User added success')
      // }
    }catch(e){}
  }

  FutureOr<void> _loginUser(LoginUserEvent event, Emitter<AuthState> emit)async {
    emit(IsClickedAuthButton(isClicked: true));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // emit(AuthLoading());
    try{
      final loginUser = await _loginCase.call(event.user);
      if(loginUser.phone!.isNotEmpty){
        print('User added success');
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
