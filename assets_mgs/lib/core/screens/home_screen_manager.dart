import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/Incidents/presentation/screens/all_incidents.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
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

      appBar:AppBar(
        elevation: 0,

        backgroundColor: const Color(0xFF0000BA),

        centerTitle: true,

        surfaceTintColor: Colors.transparent,

        foregroundColor: Colors.white,
        title: const Text(
          "Facilities Management",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),



        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              clipBehavior: Clip.none,
              children: [

                // Notification Icon
                IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                // Notification Badge
                Positioned(
                  right: 2,
                  top: 2,

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: GestureDetector(
                      onTap: (){
                        debugPrint("12");
                        Get.to(()=>Notifications());
                      },
                      child: const Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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

          preferredSize: const Size.fromHeight(100),

          child: Padding(

            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 16,
            ),

            child: Container(

              height: 70.h,

              decoration: BoxDecoration(

                color: Colors.white.withOpacity(0.15),

                borderRadius: BorderRadius.circular(15.r),

                border: Border.all(
                  color: Colors.white24,
                ),

                boxShadow: [

                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),

              child: TabBar(

                controller: _tabController,

                dividerColor: Colors.transparent,

                indicatorSize: TabBarIndicatorSize.tab,

                padding: const EdgeInsets.all(10),

                splashBorderRadius:
                BorderRadius.circular(10),

                labelColor: const Color(0xFF0000BA),

                unselectedLabelColor: Colors.white,

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),

                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),

                indicator: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(14),

                  boxShadow: [

                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ],
                ),

                tabs:  [
                  Tab(
                    icon: Icon(Icons.warning_amber),
                    text: 'Risks',
                  ),

                  Tab(
                    icon: Icon(Icons.health_and_safety_outlined),
                    text: 'Incidents',
                  ),

                  Tab(
                    icon: Icon(Icons.inventory_2),
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
            RiskScreen(),
            AllIncidents(),
            AssetScreen(),
          ],
        ),
      ),
      drawer: Drawer(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,

      ),
    );
  }
}