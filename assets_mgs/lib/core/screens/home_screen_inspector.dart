import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/Incidents/presentation/screens/all_incidents.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/auths/presentation/bloc/auth_bloc.dart';
import '../../features/compliances/presentation/screens/compliance_screen.dart';
import '../../features/hazards/presentation/screens/hazards.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/notifications/presentation/screens/notifications.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';
import '../../features/schedules/presentation/screens/schedules.dart';

class HomeScreenInspector extends StatefulWidget {
  const HomeScreenInspector({super.key});

  @override
  State<HomeScreenInspector> createState() => _HomeScreenInspectorState();
}

class _HomeScreenInspectorState extends State<HomeScreenInspector>
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

      // backgroundColor: const Color(0xffF4F7FC),
      // backgroundColor: const Color(0xFF0000BA),
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0000BA),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: false,

        /// 👇 makes appBar compact like Xender
        toolbarHeight: 60,

        titleSpacing: 0,

        title: const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            "Facilities Management",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16, // smaller like Xender
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 22, // reduced size (clean like Xender)
                  ),
                ),

                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint("12");
                        Get.to(() => Notifications());
                      },
                      child: const Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 8,
            ),
            child: Container(
              height: 30.h, // 🔥 very small
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24),
              ),

              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,

                indicatorSize: TabBarIndicatorSize.tab,
                splashBorderRadius: BorderRadius.circular(10),

                labelColor: const Color(0xFF0000BA),
                unselectedLabelColor: Colors.white,

                labelPadding: EdgeInsets.zero, // 🔥 removes extra spacing

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10, // smaller text
                ),
                unselectedLabelStyle:  TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 6.sp,
                ),

                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                tabs: const [
                  Tab(
                    icon: Icon(Icons.warning_amber, size: 14),
                    text: 'Hazards',
                    height: 34, // 🔥 reduces tab height
                  ),
                  Tab(
                    icon: Icon(Icons.inventory_2, size: 14),
                    text: 'Assets',
                    height: 34,
                  ),
                  Tab(
                    icon: Icon(Icons.calendar_month_outlined, size: 14),
                    text: 'Compliance',
                    height: 34,
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
            // RiskScreen(),
            Hazards(),
            // AllIncidents(),
            AssetScreen(),
            // Schedules(),
            ComplianceScreen()
          ],
        ),
      ),
      drawer:DrawerWidget()
    );
  }
}