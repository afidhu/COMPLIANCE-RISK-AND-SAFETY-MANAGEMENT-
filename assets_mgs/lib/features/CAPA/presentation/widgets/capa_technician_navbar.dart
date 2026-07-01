
import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';

import '../screens/capa_technician.dart';
import '../screens/completed_approved_capa.dart';


class CapaTechnicianNavbar extends StatefulWidget {
  const CapaTechnicianNavbar({super.key});

  @override
  State<CapaTechnicianNavbar> createState() => _CapaTechnicianNavbarState();
}

class _CapaTechnicianNavbarState extends State<CapaTechnicianNavbar> {

  int currentIndex = 0;

  List pages = [
    CapaTechnician(),
    CompletedApprovedCapa()
    // Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeSurfaceColor(context),
      body: pages[currentIndex],

        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(14),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              /// ================= HOME =================
              _navItem(
                index: 0,
                icon: Icons.home_rounded,
                label: "Home",
              ),

              /// ================= HISTORY =================
              _navItem(
                index: 1,
                icon: Icons.history_sharp,
                label: "History",
              ),
            ],
          ),
        ),
      drawerScrimColor:themeSurfaceColor(context),

      drawer: DrawerWidget()
    );
  }
  Widget _navItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF0000BA).withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [

            /// ICON ANIMATION
            AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: isActive ? 1.2 : 1.0,
              child: Icon(
                icon,
                size: 24,
                color: isActive
                    ? const Color(0xFF0000BA)
                    : Colors.grey.shade600,
              ),
            ),

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: SizedBox(width: isActive ? 8 : 0),
            ),

            /// LABEL (ONLY SHOW WHEN ACTIVE → CLEAN UI)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isActive
                  ? Text(
                label,
                key: ValueKey(label),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0000BA),
                ),
              )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}