import 'package:assets_mgs/features/auths/domain/entities/user_entity.dart';
import 'package:assets_mgs/features/auths/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../notifications/presentation/bloc/notification_bloc.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final playerIdController = TextEditingController();

  String? role;
  String status = "ACTIVE";

  bool obscurePassword = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPlayerId();
  }

  late String playerId;

  Future<void> getPlayerId() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Obtain playId
    final obtainedPlayerId = prefs.getString('playerId');
    if (obtainedPlayerId
        .toString()
        .isNotEmpty) {
      setState(() {
        playerId = obtainedPlayerId.toString();
        print('Success_get_playerId: $playerId');
      });
    }
    else {
      print('Fail_to_playerId ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF4F7FC),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

            /// HEADER
            Container(

            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 50,
            ),

            decoration: const BoxDecoration(

              gradient: LinearGradient(
                colors: [
                  Color(0xff001F8B),
                  Color(0xff0048FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),

            child: Column(

              children: const [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_add_alt_1,
                    size: 50,
                    color: Color(0xff001F8B),
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Facility Compliance Management",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Padding(

            padding: const EdgeInsets.all(20),

            child: Form(

                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                child: Column(

                  children: [

                  /// FULL NAME
                  buildTextField(
                  controller: fullNameController,
                  label: "Full Name",
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 18),

                /// EMAIL
                buildTextField(
                  controller: emailController,
                  label: "Email Address",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 18),

                /// PHONE
                buildTextField(
                  controller: phoneController,
                  label: "Phone Number",
                  icon: Icons.phone_outlined,
                ),

                const SizedBox(height: 18),

                /// PASSWORD
                TextFormField(

                  controller: passwordController,
                  obscureText: obscurePassword,

                  decoration: InputDecoration(

                    labelText: "Password",

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),

                    suffixIcon: IconButton(

                      onPressed: () {
                        setState(() {
                          obscurePassword =
                          !obscurePassword;
                        });
                      },

                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// ROLE
                DropdownButtonFormField<String>(

                  value: role,

                  decoration: InputDecoration(

                    labelText: "Role",

                    prefixIcon: const Icon(
                      Icons.badge_outlined,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  items: const [

                    DropdownMenuItem(
                      value: "INSPECTOR",
                      child: Text("Inspector"),
                    ),

                    DropdownMenuItem(
                      value: "TECHNICIAN",
                      child: Text("Technician"),
                    ),

                    DropdownMenuItem(
                      value: "STAFF_MEMBER",
                      child: Text("staff member"),
                    ),

                    // DropdownMenuItem(
                    //   value: "ESTATE_MANAGER",
                    //   child: Text("Estate Manager"),
                    // ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      role = value;
                    });
                  },
                ),

                // const SizedBox(height: 18),

                /// PLAYER ID
                // buildTextField(
                //   controller: playerIdController,
                //   label: "Player ID",
                //   icon: Icons.notifications_active,
                // ),

                // const SizedBox(height: 18),
                //
                // /// STATUS
                // DropdownButtonFormField<String>(
                //
                //   value: status,
                //
                //   decoration: InputDecoration(
                //
                //     labelText: "Status",
                //
                //     prefixIcon: const Icon(
                //       Icons.verified_user_outlined,
                //     ),
                //
                //     filled: true,
                //     fillColor: Colors.white,
                //
                //     border: OutlineInputBorder(
                //       borderRadius:
                //       BorderRadius.circular(15),
                //     ),
                //   ),
                //
                //   items: const [
                //
                //     DropdownMenuItem(
                //       value: "ACTIVE",
                //       child: Text("Active"),
                //     ),
                //
                //     DropdownMenuItem(
                //       value: "INACTIVE",
                //       child: Text("Inactive"),
                //     ),
                //   ],
                //
                //   onChanged: (value) {
                //     setState(() {
                //       status = value!;
                //     });
                //   },
                // ),
                //
                const SizedBox(height: 30),

                /// REGISTER BUTTON
                SizedBox(

                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () {
                      // print('playerId_playerId_playerId:$playerId');
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(RegisterUserEvent(
                            UserEntity(
                                email: emailController.text.trim(),
                                phone: phoneController.text.trim(),
                                role: role,
                                fullName: fullNameController.text.trim(),
                                status: "INACTIVE",
                                password: passwordController.text.trim(),
                                playerId: playerId.trim()
                            )
                        ));
                        // RegisterUserEvent
                        fullNameController.clear();
                        emailController.clear();
                            passwordController.clear();
                        phoneController.clear();
                            playerIdController.clear();
                      }
                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor:
                      const Color(0xff0038FF),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                      ),

                      elevation: 8,
                    ),

                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if(state is AuthMessage){
                          Get.snackbar('Fail', state.message.toString(),dismissDirection: DismissDirection.down);
                        }
                        else if (state is AuthRegisterSuccess) {
                          Get.snackbar(
                            'Registration Successful',
                            state.message.toString(),
                            snackPosition: SnackPosition.TOP,
                            dismissDirection: DismissDirection.down,
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            borderRadius: 16,
                            // Modern gradient color configuration
                            backgroundGradient: const LinearGradient(
                              colors: [Color(0xFF00B09B), Color(0xFF96C93D)], // Premium Emerald Teal gradient
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            colorText: Colors.white,
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 28,
                            ),
                            shouldIconPulse: true,
                            boxShadows: [
                              BoxShadow(
                                color: const Color(0xFF07963C).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            duration: const Duration(seconds: 3),
                          );

                          // Clean transition to LoginScreen
                          Get.off(
                                () =>  LoginScreen(),

                            duration: const Duration(milliseconds: 300),
                          );
                        }

                      },
                       builder: (BuildContext context, AuthState state) {
                      final isClicked = state is IsClickedAuthButton && state.isClicked;
                      if(isClicked){
                        return  Center(child: CircularProgressIndicator(),);
                      }
                      return Text(

                          "REGISTER",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.white
                          )
                      );
                       },

                    ),
                  ),
                ),


                const SizedBox(height: 13),

            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Text(
                  "Already have account?",
                ),

                TextButton(

                  onPressed: () {
                    Get.to(()=>LoginScreen());
                  },

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }

  Widget buildTextField({

    required TextEditingController controller,
    required String label,
    required IconData icon,

  }) {
    return TextFormField(

      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val){
        if(val!.isEmpty){
          return 'Please This Field required';
        }
        return null;
      },

      decoration: InputDecoration(

        labelText: label,

        prefixIcon: Icon(icon),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(15),
        ),
      ),
    );
  }
}