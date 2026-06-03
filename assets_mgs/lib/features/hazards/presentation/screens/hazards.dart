import 'package:assets_mgs/features/hazards/presentation/screens/register_hazards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../compliances/presentation/screens/compliance_screen.dart';
import '../../../risks/presentation/screens/Risk_screen.dart';
import '../../../risks/presentation/screens/risks_details.dart';

class Hazards extends StatefulWidget {
  const Hazards({super.key});

  @override
  State<Hazards> createState() => _HazardsState();
}

class _HazardsState extends State<Hazards> {

  /// SAMPLE HAZARD DATA
  final List<Map<String, dynamic>> hazards = [

    {
      "hazard_id": 1,
      "asset_id": "LIFT-001",
      "compliance_id": "COMP-101",
      "hazard_title": "Lift Door Malfunction",
      "hazard_description":
      "Lift doors are not closing properly and may trap passengers.",
      "reported_by": "Inspector Juma",
      "status": "Open",
      "created_at": "2026-05-20",
    },

    {
      "hazard_id": 2,
      "asset_id": "FIRE-002",
      "compliance_id": null,
      "hazard_title": "Lift inspection overdue",
      "hazard_description":
      "Emergency exit blocked by stored materials.",
      "reported_by": "System",
      "status": "closed",
      "created_at": "2026-05-21",
    },

    {
      "hazard_id": 3,
      "asset_id": "ELEC-003",
      "compliance_id": "COMP-104",
      "hazard_title": "Exposed Electrical Wires",
      "hazard_description":
      "Live wires exposed near office entrance.",
      "reported_by": "Alex",
      "status": "In Progress",
      "created_at": "2026-05-22",
    },

    {
      "hazard_id": 4,
      "asset_id": "BOILER-004",
      "compliance_id": null,
      "hazard_title": "Pressure Leakage",
      "hazard_description":
      "Boiler pressure valve leaking steam.",
      "reported_by": "System",
      "status": "Closed",
      "created_at": "2026-05-24",
    },
  ];

  Color getStatusColor(String status) {

    switch (status) {

      case "Open":
        return Colors.orange;

      case "Critical":
        return Colors.red;

      case "In Progress":
        return Colors.blue;

      case "Closed":
        return Colors.black.withOpacity(0.36);

      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {

    switch (status) {

      case "Open":
        return Icons.warning_amber;

      case "Critical":
        return Icons.dangerous;

      case "In Progress":
        return Icons.pending_actions;

      case "Closed":
        return Icons.check_circle;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      // appBar: AppBar(
      //   title: const Text("Hazards Register"),
      //   backgroundColor: const Color(0xFF0000BA),
      //   foregroundColor: Colors.white,
      // ),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: hazards.length,

        itemBuilder: (context, index) {

          final hazard = hazards[index];

          return Container(

            margin: const EdgeInsets.only(bottom: 16),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(18),

              boxShadow: [

                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(

                  children: [

                    Container(

                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(

                        color: getStatusColor(
                          hazard["status"],
                        ).withOpacity(0.1),

                        shape: BoxShape.circle,
                      ),

                      child: Icon(

                        getStatusIcon(
                          hazard["status"],
                        ),

                        color: getStatusColor(
                          hazard["status"],
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(

                            hazard["hazard_title"],

                            style: const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          // const SizedBox(height: 4),
                          //
                          // Text(
                          //   "Hazard ID: #${hazard["hazard_id"]}",
                          //   style: const TextStyle(
                          //     color: Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Text(
                  hazard["hazard_description"],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),

                const Divider(height: 24),

                Row(
                  children: [
                    const Icon(
                      Icons.inventory_2,
                      size: 1,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Asset: ${hazard["asset_id"]}",
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Row(
                //   children: [
                //     const Icon(
                //       Icons.verified_user,
                //       size: 18,
                //       color: Colors.orange,
                //     ),
                //     const SizedBox(width: 6),
                //
                //     Expanded(
                //       child: Text(
                //         "Compliance: ${hazard["compliance_id"] ?? "Not Linked"}",
                //       ),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 18,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 6),

                    Text(
                      "Reported By: ${hazard["reported_by"]}",
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.purple,
                    ),
                    const SizedBox(width: 6),

                    Text(
                      "Created: ${hazard["created_at"]}",
                    ),

                    Spacer(),
                    Container(

                      padding:
                       EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(

                        color: getStatusColor(
                          hazard["status"],
                        ).withOpacity(0.1),

                        borderRadius:
                        BorderRadius.circular(8),
                      ),

                      child: TextButton.icon(
                        onPressed: () {
                          Get.to(()=>RisksDetails());
                        },
                        icon: Icon(Icons.arrow_forward, color: Colors.blue,size: 10.sp,),
                        iconAlignment: IconAlignment.end,
                        label:
                        Text(

                          hazard["status"],

                          style: TextStyle(
                            color: getStatusColor(
                              hazard["status"],
                            ),
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          /// Add Hazard
          Get.to(()=>RegisterHazards());
          // Get.to(()=>ComplianceScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}