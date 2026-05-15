import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'add_Schedules.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {

  // Sample Schedule Data
  final List<Map<String, dynamic>> schedules = [
    {
      "schedule_id": 1,
      "asset_id": "FIRE-001",
      "conduct_date": "2026-05-20",
      "status": "Pending",
    },
    {
      "schedule_id": 2,
      "asset_id": "LIFT-002",
      "conduct_date": "2026-05-18",
      "status": "Completed",
    },
    {
      "schedule_id": 3,
      "asset_id": "ELEC-003",
      "conduct_date": "2026-05-15",
      "status": "Overdue",
    },
    {
      "schedule_id": 4,
      "asset_id": "BOILER-004",
      "conduct_date": "2026-05-25",
      "status": "Pending",
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Overdue":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Completed":
        return Icons.check_circle;
      case "Pending":
        return Icons.pending;
      case "Overdue":
        return Icons.warning;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),


      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedules.length,
        itemBuilder: (context, index) {

          final schedule = schedules[index];

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

            child: Row(
              children: [

                // Status Icon
                Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: getStatusColor(
                      schedule["status"],
                    ).withOpacity(0.1),

                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    getStatusIcon(schedule["status"]),
                    color: getStatusColor(schedule["status"]),
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                // Schedule Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Schedule #${schedule["schedule_id"]}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Asset ID: ${schedule["asset_id"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Conduct Date: ${schedule["conduct_date"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: getStatusColor(
                      schedule["status"],
                    ).withOpacity(0.1),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    schedule["status"],

                    style: TextStyle(
                      color: getStatusColor(schedule["status"]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),

        onPressed: () {
          Get.to(()=>AddSchedules());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class Schedules extends StatelessWidget {
//   Schedules({super.key});
//
//   /// SAMPLE SCHEDULE DATA
//   final List<Map<String, dynamic>> schedules = [
//
//     {
//       "schedule_id": 1,
//       "asset_id": "FIRE-001",
//       "conduct_date": "2026-05-10",
//       "status": "Completed",
//     },
//
//     {
//       "schedule_id": 2,
//       "asset_id": "LIFT-002",
//       "conduct_date": "2026-05-15",
//       "status": "Pending",
//     },
//
//     {
//       "schedule_id": 3,
//       "asset_id": "ELEC-003",
//       "conduct_date": "2026-05-18",
//       "status": "Overdue",
//     },
//
//     {
//       "schedule_id": 4,
//       "asset_id": "BOILER-004",
//       "conduct_date": "2026-05-20",
//       "status": "Completed",
//     },
//   ];
//
//   Color getStatusColor(String status) {
//
//     switch (status) {
//
//       case "Completed":
//         return Colors.green;
//
//       case "Pending":
//         return Colors.orange;
//
//       case "Overdue":
//         return Colors.red;
//
//       default:
//         return Colors.grey;
//     }
//   }
//
//   IconData getStatusIcon(String status) {
//
//     switch (status) {
//
//       case "Completed":
//         return Icons.check_circle;
//
//       case "Pending":
//         return Icons.pending;
//
//       case "Overdue":
//         return Icons.warning;
//
//       default:
//         return Icons.info;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       backgroundColor: const Color(0xFFF5F7FA),
//
//       body: ListView.builder(
//
//         padding: const EdgeInsets.all(16),
//
//         itemCount: schedules.length,
//
//         itemBuilder: (context, index) {
//
//           final schedule = schedules[index];
//
//           return Container(
//
//             margin: const EdgeInsets.only(bottom: 16),
//
//             padding: const EdgeInsets.all(16),
//
//             decoration: BoxDecoration(
//
//               color: Colors.white,
//
//               borderRadius: BorderRadius.circular(18),
//
//               boxShadow: [
//
//                 BoxShadow(
//                   blurRadius: 6,
//                   color: Colors.black.withOpacity(0.05),
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//
//             child: Row(
//
//               children: [
//
//                 /// STATUS ICON
//                 Container(
//
//                   padding: const EdgeInsets.all(12),
//
//                   decoration: BoxDecoration(
//
//                     color: getStatusColor(
//                       schedule["status"],
//                     ).withOpacity(0.1),
//
//                     shape: BoxShape.circle,
//                   ),
//
//                   child: Icon(
//
//                     getStatusIcon(
//                       schedule["status"],
//                     ),
//
//                     color: getStatusColor(
//                       schedule["status"],
//                     ),
//
//                     size: 28,
//                   ),
//                 ),
//
//                 const SizedBox(width: 16),
//
//                 /// DETAILS
//                 Expanded(
//
//                   child: Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//
//                     children: [
//
//                       Text(
//                         "Schedule #${schedule["schedule_id"]}",
//
//                         style: const TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       const SizedBox(height: 6),
//
//                       Text(
//                         "Asset ID: ${schedule["asset_id"]}",
//
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//
//                       const SizedBox(height: 4),
//
//                       Text(
//                         "Conduct Date: ${schedule["conduct_date"]}",
//
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 /// STATUS BADGE
//                 Container(
//
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//
//                   decoration: BoxDecoration(
//
//                     color: getStatusColor(
//                       schedule["status"],
//                     ).withOpacity(0.1),
//
//                     borderRadius:
//                     BorderRadius.circular(20),
//                   ),
//
//                   child: Text(
//
//                     schedule["status"],
//
//                     style: TextStyle(
//                       color: getStatusColor(
//                         schedule["status"],
//                       ),
//
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//
//       floatingActionButton: FloatingActionButton(
//
//         backgroundColor: const Color(0xFF0000BA),
//
//         onPressed: () {
//           /// ADD SCHEDULE
//         },
//
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }