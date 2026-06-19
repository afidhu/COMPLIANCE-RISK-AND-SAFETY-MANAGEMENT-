
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';

import '../screens/capa_technician.dart';


class CapaTechnicianNavbar extends StatefulWidget {
  const CapaTechnicianNavbar({super.key});

  @override
  State<CapaTechnicianNavbar> createState() => _CapaTechnicianNavbarState();
}

class _CapaTechnicianNavbarState extends State<CapaTechnicianNavbar> {

  int currentIndex = 0;

  List pages = [
    CapaTechnician(),
    Scaffold(),
    Scaffold(),
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

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.list_alt_outlined),
          //   label: 'CAPA',
          // ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.warning),
          //   label: 'Risk',
          // ),
        ],
      ),
      drawer: Drawer(
        child: LogoutButton(),
      ),
    );
  }
}