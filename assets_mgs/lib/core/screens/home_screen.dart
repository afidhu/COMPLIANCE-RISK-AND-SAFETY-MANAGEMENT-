import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/Incidents/presentation/screens/all_incidents.dart';
import '../../features/assets/presentation/screens/asset_screen.dart';
import '../../features/inspections/presentation/screens/inspensions.dart';
import '../../features/risks/presentation/screens/Risk_screen.dart';

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

    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
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
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,

        title: const Text(
          "Compliance Management",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,)),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active, color: Colors.white,fontWeight: FontWeight.bold,size: 30,)),
              TextButton(onPressed: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(10.r))
                  ),
                  child: Text('12',
                    style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(12),
            ),

            child: TabBar(
              controller: _tabController,

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
                  text: 'Inspection',
                ),

                Tab(
                  icon: Icon(Icons.inventory_2),
                  text: 'Assets',
                ),

                Tab(
                  icon: Icon(Icons.warning_amber),
                  text: 'Risks',
                ),Tab(
                  icon: Icon(Icons.warning_amber),
                  text: 'Incidents',
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),

          child: Container(
            color: Colors.white,

            child: TabBarView(
              controller: _tabController,
              children: [
                InspectionScreen(),
                AssetScreen(),
                RiskScreen(),
                AllIncidents(),
              ],
            ),
          ),
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