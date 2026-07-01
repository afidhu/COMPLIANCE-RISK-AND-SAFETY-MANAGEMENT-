import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/themes/themes_bloc/theme_bloc.dart';
import '../../features/auths/presentation/widgets/logout_button.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Future<Map<String, String?>> _getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username'),
      'userRole': prefs.getString('userType'),
    };
  }

  final isDark = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: SafeArea(
        child: FutureBuilder<Map<String, String?>>(
          future: _getUser(),
          builder: (context, snapshot) {
            final username = snapshot.data?['username'] ?? "Guest";
            final userRole = snapshot.data?['userRole'] ?? "User";

            return Column(
              children: [
                /// ================= HEADER =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0000BA),
                        Color(0xFF2D5BFF),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 42,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        username,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userRole,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 16),

                /// ================= THEME SWITCH =================
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: BlocBuilder<ThemeBloc, ThemeMode>(
                    builder: (context, themeMode) {
                      // Calculate if dark mode is active (handles system settings fallbacks cleanly)
                      final isDark = themeMode == ThemeMode.dark ||
                          (themeMode == ThemeMode.system && MediaQuery.platformBrightnessOf(context) == Brightness.dark);

                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              isDark ? "Dark Mode" : "Light Mode",
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),

                          /// SWITCH
                          Switch(
                            value: isDark,
                            onChanged: (val) {
                              // 🛠️ Fire the Bloc event instantly!
                              context.read<ThemeBloc>().add(ToggleThemeEvent());
                            },
                          ),
                        ],
                      );
                    },
                  )

                ),

                const SizedBox(height: 20),

                /// ================= MENU ITEMS =================
                _drawerItem(Icons.person_outline, "Profile", () {}),
                _drawerItem(Icons.settings_outlined, "Settings", () {}),
                _drawerItem(Icons.notifications_outlined, "Notifications", () {}),
                _drawerItem(Icons.help_outline, "Help & Support", () {}),

                const Spacer(),

                /// ================= LOGOUT =================
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: LogoutButton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// ================= MENU ITEM =================
  Widget _drawerItem(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
        size: 14,
      ),
      onTap: onTap,
    );
  }
}
