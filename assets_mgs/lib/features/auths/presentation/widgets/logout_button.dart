import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../cubit/auth_cubit.dart';


class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
        BlocListener<AuthCubit,AuthState>(
        child:         OutlinedButton(onPressed: ()=>{
          context.read<AuthCubit>().logoutUserRequest()
        }, child: Icon(Icons.logout_outlined)),
            listener: (context, state){
          if(state is AuthLogout ){
            Get.defaultDialog(
                content: Text(state.message.toString()),

                actions: [
                  OutlinedButton(onPressed: (){Get.back();}, child: Text('Close')),
                  OutlinedButton(onPressed: (){
                    context.read<AuthCubit>().logoutUserSuccess();

                  }, child: Text('Logout'))
                ]
            );
          }
          else if(state is AuthLogout){
            Get.snackbar('Success', state.message.toString());
          }
        });
    }
  }

