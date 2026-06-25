import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubit/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLogout) {
          Get.defaultDialog(
            title: "Logout",

            content: Text(state.message),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Close'),
              ),
              OutlinedButton(
                onPressed: () {
                  context.read<AuthCubit>().logoutUserSuccess();
                },
                child: const Text('Logout'),
              ),
            ],
          );
        }
      },
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.red),
          iconColor: WidgetStatePropertyAll(Colors.red),
        surfaceTintColor: WidgetStatePropertyAll(Colors.red),
          backgroundColor: WidgetStatePropertyAll(Colors.red)
        ),
        onPressed: () {
          context.read<AuthCubit>().logoutUserRequest();
        },
        child: const Icon(Icons.logout_outlined, color: Colors.white,size: 20,),
      ),
    );
  }
}
