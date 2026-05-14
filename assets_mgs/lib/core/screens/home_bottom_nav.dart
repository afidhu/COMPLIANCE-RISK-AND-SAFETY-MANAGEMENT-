import 'package:flutter/material.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';
import 'home_screen.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {

  int currentIndex = 0;

  List pages = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    // InspectionScreen(),
    // AssetScreen(),
    // RiskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,

        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Reports',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.inventory),
          //   label: 'Asset',
          // ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.warning),
          //   label: 'Risk',
          // ),
        ],
      ),
    );
  }
}