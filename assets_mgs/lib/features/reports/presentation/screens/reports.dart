import 'package:assets_mgs/features/reports/presentation/screens/risk_reports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'assets_report.dart';
import 'incident_report.dart';

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
            fontWeight: FontWeight.w600,
            fontSize: 16, // smaller title (FIX)
          ),
        ),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 10,
            ),
            child: Container(
              height: 55, // FIX: reduced from 75.h → avoids overflow
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white24),
              ),

              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),

                splashBorderRadius: BorderRadius.circular(12),

                labelColor: const Color(0xFF0000BA),
                unselectedLabelColor: Colors.white,

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11, // FIX smaller text
                ),

                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11, // FIX smaller text
                ),

                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                tabs: const [
                  Tab(
                    icon: Icon(Icons.report_problem, size: 18), // FIX
                    text: "Incidents",
                  ),
                  Tab(
                    icon: Icon(Icons.inventory_2, size: 18), // FIX
                    text: "Assets",
                  ),
                  Tab(
                    icon: Icon(Icons.warning_amber, size: 18), // FIX
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

        IncidentReport(),

          /// ASSETS REPORT
          AssetsReport(),

          /// RISKS REPORT
          RiskReports()
        ],
      ),
    );
  }
}