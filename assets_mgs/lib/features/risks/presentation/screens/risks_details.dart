import 'package:assets_mgs/features/mitigations/presentation/screens/all_mitigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CAPA/presentation/screens/all_capa.dart';
import 'Risk_screen.dart';

class RisksDetails extends StatefulWidget {

  // final Map<String, dynamic> risk;

  const RisksDetails({
    super.key,});

  @override
  State<RisksDetails> createState() => _RisksDetailsState();
}

class _RisksDetailsState extends State<RisksDetails>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final Color primaryColor = const Color(0xFF0000BA);

  /// SAMPLE MITIGATION DATA
  final List<Map<String, dynamic>> mitigations = [
    {
      "mitigation_id": 1,
      "risk_id": 1,
      "mitigation_name": "Close lift immediately",
      "created_date": "12/05/2026"
    },
  ];

  /// SAMPLE CAPA DATA
  final List<Map<String, dynamic>> capas = [
    {
      "capa_id": 1,
      "risk_id": 1,
      "corrective_action": "Repair lift motor",
      "preventive_action":
      "Schedule monthly inspections",
      "deadline": "20/05/2026",
      "status": "Pending"
    }
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // backgroundColor: const Color(0xFFF5F7FA),
      backgroundColor: const Color(0xFF0000BA),
      appBar: AppBar(
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close_outlined,color: Colors.red, size: 14.sp,),
          ),
        ],
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text("Risk Details"),
        bottom: PreferredSize(
      preferredSize: const Size.fromHeight(75),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
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

              text: "Risk",
              icon: Icon(Icons.warning_amber),
            ),

            Tab(
              text: "Mitigation",
              icon: Icon(Icons.directions_run_outlined),
            ),

            Tab(
              text: "CAPA",
              icon: Icon(Icons.pending_actions),
            ),
          ],
        ),
      ),
    ),

      ),

      body: TabBarView(
        controller: _tabController,

        children: [

          /// RISK DETAILS
          // buildRiskDetails(),
          RiskScreen(),

          /// MITIGATION
          AllMitigations(mitigations: [{
            "mitigation_id": 1,
            "risk_id": 1,
            "mitigation_name": "Close lift immediately",
            "created_date": "12/05/2026"
          },]),

          /// CAPA
          AllCapa(capas: [
            {
              "capa_id": 1,
              "risk_id": 1,
              "corrective_action": "Repair lift motor",
              "preventive_action":
              "Schedule monthly inspections",
              "deadline": "20/05/2026",
              "status": "Pending"
            }
          ]),
        ],
      ),
    );
  }

  /// RISK DETAILS
  // Widget buildRiskDetails() {
  //
  //   return Padding(
  //     padding: const EdgeInsets.all(16),
  //
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(18),
  //       ),
  //
  //       child: Padding(
  //         padding: const EdgeInsets.all(18),
  //
  //         child: Column(
  //           crossAxisAlignment:
  //           CrossAxisAlignment.start,
  //
  //           children: [
  //
  //             buildTile(
  //               title: "Risk ID",
  //               value: "#${widget.risk["id"]}",
  //             ),
  //
  //             buildTile(
  //               title: "Asset ID",
  //               value: widget.risk["asset_id"],
  //             ),
  //
  //             buildTile(
  //               title: "Hazard",
  //               value: widget.risk["hazard"],
  //             ),
  //
  //             buildTile(
  //               title: "Risk Level",
  //               value: widget.risk["risk_level"],
  //               color: Colors.red,
  //             ),
  //
  //             buildTile(
  //               title: "Reported by:",
  //               value: widget.risk["reported_by"],
  //               color: Colors.green,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }



  /// CAPA


  /// REUSABLE TILE
  Widget buildTile({
    required String title,
    required String value,
    Color color = Colors.black,
  }) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

}