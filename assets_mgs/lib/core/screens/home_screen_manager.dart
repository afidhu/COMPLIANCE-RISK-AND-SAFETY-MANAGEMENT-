import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:assets_mgs/features/notifications/presentation/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/Incidents/presentation/screens/all_incidents.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/hazards/presentation/screens/hazards.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/notifications/presentation/screens/notifications.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';
import '../../features/schedules/presentation/screens/schedules.dart';

class HomeScreenManager extends StatefulWidget {
  const HomeScreenManager({super.key});

  @override
  State<HomeScreenManager> createState() => _HomeScreenManagerState();
}

class _HomeScreenManagerState extends State<HomeScreenManager>
    with TickerProviderStateMixin {

  late final TabController _tabController;



  @override
  void initState(){
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF4F7FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0000BA),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,

        title: const Text(
          "Facilities Management",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16, // 🔥 smaller to prevent overflow
          ),
        ),

        actions: [
          notificationButton()
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),

          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 12,
            ),

            child: Container(
              height: 55, // 🔥 reduced height (fix overflow)

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white24),
              ),

              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,

                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.all(6),

                labelColor: const Color(0xFF0000BA),
                unselectedLabelColor: Colors.white,

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10, // 🔥 smaller text
                ),

                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),

                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                tabs: const [
                  Tab(
                    icon: Icon(Icons.warning_amber, size: 18),
                    text: 'Hazards',
                  ),
                  Tab(
                    icon: Icon(Icons.health_and_safety_outlined, size: 18),
                    text: 'Incidents',
                  ),
                  Tab(
                    icon: Icon(Icons.inventory_2, size: 18),
                    text: 'Assets',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: TabBarView(
          controller: _tabController,

          physics: const BouncingScrollPhysics(),

          children: const [
            Hazards(),
            AllIncidents(),
            AssetScreen(),
          ],
        ),
      ),
      drawer:DrawerWidget()
    );
  }
}