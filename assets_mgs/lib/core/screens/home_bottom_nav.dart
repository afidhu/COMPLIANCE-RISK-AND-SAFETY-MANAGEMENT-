import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import '../../features/reports/presentation/screens/reports.dart';
import '../../features/searchings/presentation/screens/all_searching.dart';
import 'home_screen_inspector.dart';
import 'home_screen_manager.dart';

class HomeBottomNav extends StatefulWidget {
  final String userType;
  const HomeBottomNav({super.key, required this.userType});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {

  int currentIndex = 0;



  late List pages = [

    widget.userType =="INSPECTOR"? HomeScreenInspector():HomeScreenManager(),
    AllSearching(),
    Reports(),
    // InspectionScreen(),
    // AssetScreen(),
    // RiskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              backgroundColor: Colors.white,
              elevation: 0,
              selectedItemColor: const Color(0xFF0000BA),
              unselectedItemColor: Colors.grey.shade500,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              showUnselectedLabels: true,
              onTap: (val) {
                setState(() {
                  currentIndex = val;
                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: _navIcon(Icons.home_outlined, 0),
                  activeIcon: _navIcon(Icons.home, 0, active: true),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: _navIcon(Icons.search_outlined, 1),
                  activeIcon: _navIcon(Icons.search, 1, active: true),
                  label: 'Search',
                ),

                BottomNavigationBarItem(
                  icon: _navIcon(Icons.picture_as_pdf_outlined, 2),
                  activeIcon: _navIcon(Icons.picture_as_pdf, 2, active: true),
                  label: 'Reports',
                ),
              ],
            ),
          ),
        ),
      drawer:DrawerWidget()
    );
  }
  Widget _navIcon(IconData icon, int index, {bool active = false}) {
    final isSelected = currentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF0000BA).withOpacity(0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        size: isSelected ? 26 : 22,
        color: isSelected ? const Color(0xFF0000BA) : Colors.grey,
      ),
    );
  }
}