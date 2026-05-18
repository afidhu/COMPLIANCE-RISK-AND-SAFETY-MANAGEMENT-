import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/Incidents/presentation/screens/all_incidents.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';
import '../../features/schedules/presentation/screens/schedules.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
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
        elevation: 9,
        // backgroundColor: Colors.blue.shade900,
        backgroundColor: const Color(0xFF0000BA),
        centerTitle: true,

        title: const Text(
          "Facilities Management",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,

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
              ],
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),

          child: Container(
            height: 55,

            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(14),
            ),

            child: TabBar(
              controller: _tabController,

              isScrollable: true,

              tabAlignment: TabAlignment.start,

              padding: const EdgeInsets.symmetric(horizontal: 8),

              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),

              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),

              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              labelColor: Colors.blue.shade900,
              unselectedLabelColor: Colors.white,

              indicatorSize: TabBarIndicatorSize.tab,

              dividerColor: Colors.transparent,

              tabs: const [

                Tab(
                  icon: Icon(Icons.fact_check),
                  text: 'Schedules',
                ),

                Tab(
                  icon: Icon(Icons.inventory_2),
                  text: 'Assets',
                ),

                Tab(
                  icon: Icon(Icons.warning_amber),
                  text: 'Risks',
                ),

                Tab(
                  icon: Icon(Icons.health_and_safety_outlined),
                  text: 'Incidents',
                ),
              ],
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
            Schedules(),
            AssetScreen(),
            RiskScreen(),
            AllIncidents(),
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