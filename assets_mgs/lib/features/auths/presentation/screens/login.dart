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

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 420),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo/Icon
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF0000BA).withOpacity(0.1),
                              const Color(0xFF0000BA).withOpacity(0.05),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0000BA).withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: ClipOval(
                          child: Image.asset(
                            'images/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        "Smart Facility Compliance",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                          letterSpacing: -0.5,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Manage assets, inspections & compliance",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    "Welcome back",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Enter your credentials to access your account",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Email Field
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF111827),
                          ),
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            hintText: "Enter your email",
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0000BA),
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color(0xFF0000BA),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Password Field
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF111827),
                          ),
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0000BA),
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color(0xFF0000BA),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      ),
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF0000BA),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
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
                          } else {
                            if (state.user.role == 'INSPECTOR' ||
                                state.user.role == 'ESTATE_MANAGER') {
                              Get.offAll(
                                () => HomeBottomNav(
                                  userType: state.user.role.toString(),
                                ),
                              );
                            } else if (state.user.role == 'TECHNICIAN') {
                              Get.offAll(() => CapaTechnicianNavbar());
                            } else if (state.user.role == 'STAFF_MEMBER') {
                              Get.offAll(RegisterHazards());
                            }
                          }
                        } else if (state is AuthMessage) {
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
                                      backgroundColor: Colors.red.withOpacity(
                                        .1,
                                      ),
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
                                          backgroundColor: const Color(
                                            0xFF0000BA,
                                          ),
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
                            state is IsClickedAuthButton && state.isClicked;

                        return ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                      LoginUserEvent(
                                        UserEntity(
                                          email: emailController.text.trim(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    Get.dialog(
                                      Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 28,
                                                backgroundColor: Colors.orange
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
                                                  fontWeight: FontWeight.bold,
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
                                                  onPressed: () => Get.back(),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                              0xFF0000BA,
                                                            ),
                                                        foregroundColor:
                                                            Colors.white,
                                                      ),
                                                  child: const Text("OK"),
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
                            backgroundColor: const Color(0xFF0000BA),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            disabledBackgroundColor: Colors.grey.shade300,
                          ),

                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.login_rounded, size: 20),
                                      SizedBox(width: 12),
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF0000BA),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
