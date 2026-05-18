import 'package:flutter/material.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/reports/presentation/screens/reports.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';
import '../../features/searchings/presentation/screens/all_searching.dart';
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
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf_sharp),
            label: 'Reports',
          ),



          // BottomNavigationBarItem(
          //   icon: Icon(Icons.warning),
          //   label: 'Risk',
          // ),
        ],
      ),
    );
  }
}