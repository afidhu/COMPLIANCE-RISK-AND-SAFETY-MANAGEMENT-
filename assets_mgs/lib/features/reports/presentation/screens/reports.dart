import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports>
    with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
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

        leading: const SizedBox.shrink(),

        elevation: 0,

        backgroundColor: const Color(0xFF0000BA),

        centerTitle: true,

        title: const Text(
          "Facilities Reports",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        surfaceTintColor: Colors.transparent,

        foregroundColor: Colors.white,

        bottom: PreferredSize(

          preferredSize: const Size.fromHeight(90),

          child: Padding(

            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 16,
            ),

            child: Container(

              height: 75.h,

              decoration: BoxDecoration(

                color: Colors.white.withOpacity(0.15),

                borderRadius: BorderRadius.circular(18),

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

                padding: const EdgeInsets.all(16),

                splashBorderRadius:
                BorderRadius.circular(14),

                labelColor: const Color(0xFF0000BA),

                unselectedLabelColor: Colors.white,

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),

                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
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

                tabs: const [

                  Tab(
                    icon: Icon(Icons.report_problem),
                    text: "Incidents",
                  ),

                  Tab(
                    icon: Icon(Icons.inventory_2),
                    text: "Assets",
                  ),

                  Tab(
                    icon: Icon(Icons.warning_amber),
                    text: "Risks",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: TabBarView(

        controller: _tabController,

        physics: const BouncingScrollPhysics(),

        children: [

          /// INCIDENTS REPORT
          Container(
            margin: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Center(
              child: Text(
                "Incidents Reports",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// ASSETS REPORT
          Container(
            margin: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Center(
              child: Text(
                "Assets Reports",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// RISKS REPORT
          Container(
            margin: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Center(
              child: Text(
                "Risks Reports",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}