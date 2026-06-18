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