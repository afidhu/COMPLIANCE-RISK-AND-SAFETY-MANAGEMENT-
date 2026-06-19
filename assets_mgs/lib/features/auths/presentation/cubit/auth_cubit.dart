import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  
  void logoutUserRequest(){
    emit(AuthLogout('Do you want to Logout'));
  }

  void logoutUserSuccess() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // emit(AuthLogout('Logout Successful'));
    Get.back();
    Get.off(()=>LoginScreen());
  }
}

