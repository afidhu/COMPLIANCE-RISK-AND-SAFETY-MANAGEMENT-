import 'package:assets_mgs/features/auths/domain/entities/user_entity.dart';
import 'package:assets_mgs/features/auths/presentation/bloc/auth_bloc.dart';
import 'package:assets_mgs/features/auths/presentation/screens/register_screen.dart';
import 'package:assets_mgs/features/hazards/presentation/screens/register_hazards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/screens/home_bottom_nav.dart';
import '../../../../core/screens/home_screen_inspector.dart';
import '../../../../core/screens/home_screen_manager.dart';
import '../../../../core/screens/un_approved_screen.dart';
import '../../../CAPA/presentation/widgets/capa_technician_navbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo/Icon
                  /// LOGO + TITLE SECTION
                  Column(
                    children: [
        
                      /// LOGO CONTAINER
                      Container(
        
                        height: 170,
                        width: 170,
        
                        decoration: BoxDecoration(
        
                          shape: BoxShape.circle,
        
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade50,
                              Colors.white,
                            ],
                          ),
        
                          boxShadow: [
        
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.18),
                              blurRadius: 30,
                              spreadRadius: 5,
                              offset: const Offset(0, 12),
                            ),
        
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
        
                        child:   /// LOGO CONTAINER
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF0000BA).withOpacity(0.04),
                            border: Border.all(
                              color: const Color(0xFF0000BA).withOpacity(0.08),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: ClipOval(
                            child: Image.asset(
                              'images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 28),
        
                      /// TITLE
                      const Text(
                        "Smart Facility Compliance Platform",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                          letterSpacing: 0.5,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
        
                      const SizedBox(height: 12),
        
                      /// SUBTITLE
                      Text(
                        "Manage assets, inspections, risks and compliance activities digitally",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
        
                    ],
                  ),
        
                  const SizedBox(height: 8),
        
                  const Text(
                    "Login to continue",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
        
                  const SizedBox(height: 30),
        
                  // Email Field
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
        
                        const SizedBox(height: 20),
        
                        // Password Field
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: const Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 12),
        
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF0000BA),
                        ),
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 10),
        
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (_, state) {
                        if (state is AuthLoginSuccess) {
                          Get.snackbar(
                            "Success",
                            "Login successful",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.shade600,
                            colorText: Colors.white,
                            margin: const EdgeInsets.all(12),
                            borderRadius: 12,
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            duration: const Duration(seconds: 2),
                          );

                          if (state.user.isApproved == false) {
                            Get.off(() => UnApprovedScreen());
                          }

                          else {
                            if (state.user.role == 'INSPECTOR' ||
                                state.user.role == 'ESTATE_MANAGER') {
                              Get.offAll(
                                    () =>
                                    HomeBottomNav(
                                      userType: state.user.role.toString(),
                                    ),
                              );
                            } else if (state.user.role == 'TECHNICIAN') {
                              Get.offAll(() => CapaTechnicianNavbar());
                            }
                            else if(state.user.role =='STAFF_MEMBER'){
                              Get.offAll(RegisterHazards());
                            }
                          }
                        }
        
                        else if (state is AuthMessage) {
                          Get.dialog(
                            Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
        
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor:
                                      Colors.red.withOpacity(.1),
                                      child: const Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                    ),
        
                                    const SizedBox(height: 20),
        
                                    const Text(
                                      "Login Failed",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
        
                                    const SizedBox(height: 10),
        
                                    Text(
                                      state.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
        
                                    const SizedBox(height: 20),
        
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () => Get.back(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          const Color(0xFF0000BA),
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text("Close"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
        
                      builder: (context, state) {
                        final isLoading =
                            state is IsClickedAuthButton &&
                                state.isClicked;
        
                        return ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                LoginUserEvent(
                                  UserEntity(
                                    email: emailController.text,
                                  ),
                                ),
                              );
                            } else {
                              Get.dialog(
                                Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      children: [
        
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundColor:
                                          Colors.orange
                                              .withOpacity(.15),
                                          child: const Icon(
                                            Icons.warning_amber,
                                            color: Colors.orange,
                                            size: 32,
                                          ),
                                        ),
        
                                        const SizedBox(height: 16),
        
                                        const Text(
                                          "Validation Required",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
        
                                        const SizedBox(height: 10),
        
                                        const Text(
                                          "Please enter your credentials to continue.",
                                          textAlign: TextAlign.center,
                                        ),
        
                                        const SizedBox(height: 20),
        
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed:
                                                () => Get.back(),
                                            style:
                                            ElevatedButton
                                                .styleFrom(
                                              backgroundColor:
                                              const Color(
                                                  0xFF0000BA),
                                              foregroundColor:
                                              Colors.white,
                                            ),
                                            child:
                                            const Text("OK"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
        
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF0000BA),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                          ),
        
                          child: AnimatedSwitcher(
                            duration:
                            const Duration(milliseconds: 300),
                            child: isLoading
                                ? const SizedBox(
                              height: 24,
                              width: 24,
                              child:
                              CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                                : const Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login_rounded),
                                SizedBox(width: 10),
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
        
                  const SizedBox(height: 20),
        
                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text( "I'm not registered! ",),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>RegisterScreen());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF0000BA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
        
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}