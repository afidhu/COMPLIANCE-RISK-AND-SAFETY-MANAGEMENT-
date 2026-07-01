

import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/notifications/presentation/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/compliances/presentation/screens/compliance_screen.dart';
import '../../features/hazards/presentation/screens/hazards.dart';

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
      backgroundColor: themeSurfaceColor(context),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
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
          notificationButton()
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