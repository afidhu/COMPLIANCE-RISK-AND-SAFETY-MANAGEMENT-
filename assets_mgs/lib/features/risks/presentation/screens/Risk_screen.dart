import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../bloc/risks_bloc.dart';
import 'add_risks.dart';

class RiskScreen extends StatefulWidget {
  const RiskScreen({super.key});

  @override
  State<RiskScreen> createState() => _RiskScreenState();
}

class _RiskScreenState extends State<RiskScreen> {

  /// SAMPLE RISKS
  // final List<Map<String, dynamic>> risks = [
  //
  //   {
  //     "risk_id": 1,
  //     "hazard_id": 101,
  //     "risk_title": "Electric Shock",
  //     "likelihood": "High",
  //     "severity": "Critical",
  //     "risk_level": "High",
  //     "status": "Identified",
  //   },
  //
  //
  //   {
  //     "risk_id": 2,
  //     "hazard_id": 102,
  //     "risk_title": "Lift Passenger Injury",
  //     "likelihood": "Medium",
  //     "severity": "High",
  //     "risk_level": "Medium",
  //     "status": "Assessed",
  //   },
  //
  //   {
  //     "risk_id": 3,
  //     "hazard_id": 103,
  //     "risk_title": "Fire Spread",
  //     "likelihood": "High",
  //     "severity": "Critical",
  //     "risk_level": "Critical",
  //     "status": "Mitigating",
  //   },
  //
  //   {
  //     "risk_id": 4,
  //     "hazard_id": 104,
  //     "risk_title": "Boiler Explosion",
  //     "likelihood": "Low",
  //     "severity": "Critical",
  //     "risk_level": "High",
  //     "status": "Closed",
  //   },
  // ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Color getRiskColor(String level) {
    switch (level) {
      case "Low":
        return Colors.green;

      case "Medium":
        return Colors.orange;

      case "High":
        return Colors.deepOrange;

      case "Critical":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Identified":
        return Colors.red;

      case "Assessed":
        return Colors.orange;
      case "Mitigating":
        return Colors.deepOrange;

      case "Closed":
        return Colors.green;

      default:
        return Colors.grey;
    }
  }

  IconData getRiskIcon(String level) {
    switch (level) {
      case "Low":
        return Icons.check_circle;

      case "Medium":
        return Icons.warning_amber;

      case "High":
        return Icons.report_problem;

      case "Critical":
        return Icons.dangerous;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      // appBar: AppBar(
      //   title: const Text("Risk Register"),
      //   backgroundColor: const Color(0xFF0000BA),
      //   foregroundColor: Colors.white,
      // ),

      body: BlocBuilder<RisksBloc, RisksState>(
        builder: (context, state) {
          if (state is RisksLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is RisksMessage) {
            return Center(child: Text(state.message.toString()),);
          }
          else if (state is RisksLoaded) {
            if (state.risks.isEmpty) {
              return Center(child: Text('No Risks'),);
            }
            else {
              return ListView.builder(

                padding: const EdgeInsets.all(16),

                itemCount: state.risks.length,

                itemBuilder: (context, index) {
                  final risk = state.risks[index];


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

                              padding: const EdgeInsets.all(12),

                              decoration: BoxDecoration(

                                color: getRiskColor(
                                  risk.riskLevel.toString(),
                                ).withOpacity(0.1),

                                shape: BoxShape.circle,
                              ),

                              child: Icon(

                                getRiskIcon(
                                  risk.riskLevel.toString(),
                                ),

                                color: getRiskColor(
                                  risk.riskLevel.toString(),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(

                              child: Column(

                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(

                                    risk.riskTitle.toString(),

                                    style: const TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),

                                  // const SizedBox(height: 4),
                                  //
                                  // Text(
                                  //   "Risk ID: #${risk["risk_id"]}",
                                  //   style: const TextStyle(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),

                            Container(

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(

                                color: getRiskColor(
                                  risk.riskLevel.toString(),
                                ).withOpacity(0.1),

                                borderRadius:
                                BorderRadius.circular(20),
                              ),

                              child: Text(

                                risk.riskLevel.toString(),

                                style: TextStyle(
                                  color: getRiskColor(
                                    risk.riskLevel.toString(),
                                  ),
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 25),

                        Row(
                          children: [

                            const Icon(
                              Icons.warning_amber,
                              size: 18,
                              color: Colors.orange,
                            ),

                            // const SizedBox(width: 6),
                            //
                            // Text(
                            //   "Hazard ID: ${risk["hazard_id"]}",
                            // ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [

                            const Icon(
                              Icons.analytics,
                              size: 18,
                              color: Colors.blue,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              "Likelihood: ${risk.likelihood}",
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [

                            const Icon(
                              Icons.priority_high,
                              size: 18,
                              color: Colors.red,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              "Severity: ${risk.severity}",
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [

                            Container(

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(

                                color: getStatusColor(
                                  risk.status.toString(),
                                ).withOpacity(0.1),

                                borderRadius:
                                BorderRadius.circular(20),
                              ),

                              child: Text(

                                risk.status.toString(),

                                style: TextStyle(
                                  color: getStatusColor(
                                    risk.status.toString(),
                                  ),
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            // TextButton.icon(
                            //
                            //   onPressed: () {
                            //     // Risk Details
                            //
                            //     assetDetails({
                            //
                            //       "asset_id": "AST-001",
                            //
                            //       "asset_name": "Passenger Lift",
                            //
                            //       "asset_type": "Lift",
                            //
                            //       "location": "Block A",
                            //
                            //       "serial_no": "LFT-2026-001",
                            //
                            //       "status": "Active",
                            //
                            //       "created_by": "Admin",
                            //     });
                            //   },
                            //
                            //   iconAlignment:
                            //   IconAlignment.end,
                            //
                            //   label: const Text(
                            //     "Details",
                            //     style: TextStyle(
                            //       color: Color(0xFF0000BA),
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            //
                            //   icon: const Icon(
                            //     Icons.arrow_forward,
                            //     color: Color(0xFF0000BA),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
          return SizedBox.shrink();
        }

        ,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          // Add Risk
          Get.to(() => AddRisks());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future assetDetails(Map<String, dynamic> asset) async {
    return Get.bottomSheet(

      Container(

        padding: const EdgeInsets.all(20),

        decoration: const BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),

        child: Column(

          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Center(
              child: Text(
                "Asset Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0000BA),
                ),
              ),
            ),

            const SizedBox(height: 20),

            detailTile(
              Icons.qr_code,
              "Asset ID",
              asset["asset_id"],
            ),

            detailTile(
              Icons.inventory,
              "Asset Name",
              asset["asset_name"],
            ),

            detailTile(
              Icons.category,
              "Asset Type",
              asset["asset_type"],
            ),

            detailTile(
              Icons.location_on,
              "Location",
              asset["location"],
            ),

            detailTile(
              Icons.confirmation_number,
              "Serial No",
              asset["serial_no"] ?? "N/A",
            ),

            detailTile(
              Icons.verified,
              "Status",
              asset["status"],
            ),

            detailTile(
              Icons.person,
              "Created By",
              asset["created_by"],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      isScrollControlled: true,
    );
  }

  Widget detailTile(IconData icon,
      String title,
      String value,) {
    return Padding(

      padding: const EdgeInsets.only(bottom: 14),

      child: Row(

        children: [

          Icon(
            icon,
            color: const Color(0xFF0000BA),
          ),

          const SizedBox(width: 10),

          Text(
            "$title : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }


//   Future<void> assetCapas({
//     required Map<String, dynamic> asset,
//   }) async {
//     await Get.bottomSheet(
//
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//
//       Container(
//
//         height: Get.height * .70,
//
//         decoration: const BoxDecoration(
//           color: Colors.white,
//
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//
//         child: Column(
//
//           children: [
//
//             const SizedBox(height: 12),
//
//             Container(
//               width: 70,
//               height: 5,
//
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(50),
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             /// HEADER
//             Container(
//
//               width: double.infinity,
//
//               padding: const EdgeInsets.all(20),
//
//               decoration: const BoxDecoration(
//                 color: Color(0xFF0000BA),
//
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//
//               child: Column(
//
//                 children: [
//
//                   CircleAvatar(
//                     radius: 38,
//                     backgroundColor: Colors.white,
//
//                     child: Icon(
//                       Icons.apartment,
//                       size: 40,
//                       color: Color(0xFF0000BA),
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   Text(
//                     asset["asset_name"],
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(height: 5),
//
//                   Text(
//                     asset["asset_type"],
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(.8),
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 14,
//                       vertical: 6,
//                     ),
//
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//
//                     child: Text(
//                       asset["status"],
//                       style: const TextStyle(
//                         color: Color(0xFF0000BA),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Expanded(
//
//               child: ListView(
//
//                 padding: const EdgeInsets.all(20),
//
//                 children: [
//
//                   buildRow(
//                     "Asset ID",
//                     asset["asset_id"],
//                     Icons.qr_code,
//                   ),
//
//                   buildRow(
//                     "Location",
//                     asset["location"],
//                     Icons.location_on,
//                   ),
//
//                   buildRow(
//                     "Serial Number",
//                     asset["serial_no"] ?? "N/A",
//                     Icons.confirmation_number,
//                   ),
//
//                   buildRow(
//                     "Created By",
//                     asset["created_by"],
//                     Icons.person,
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   ElevatedButton.icon(
//
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF0000BA),
//                       minimumSize: const Size(
//                         double.infinity,
//                         55,
//                       ),
//                     ),
//
//                     onPressed: () {
//                       Get.back();
//                     },
//
//                     icon: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     ),
//
//                     label: const Text(
//                       "Close",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildRow(String title,
//       String value,
//       IconData icon,) {
//     return Container(
//
//       margin: const EdgeInsets.only(bottom: 15),
//
//       child: Row(
//
//         children: [
//
//           CircleAvatar(
//             radius: 22,
//             backgroundColor: const Color(
//               0xFF0000BA,
//             ).withOpacity(.08),
//
//             child: Icon(
//               icon,
//               color: const Color(0xFF0000BA),
//             ),
//           ),
//
//           const SizedBox(width: 14),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment:
//               CrossAxisAlignment.start,
//
//               children: [
//
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.grey.shade600,
//                     fontSize: 13,
//                   ),
//                 ),
//
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:assets_mgs/features/risks/presentation/screens/risks_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'add_risks.dart';
//
// class RiskScreen extends StatefulWidget {
// const  RiskScreen({super.key});
//
//   @override
//   State<RiskScreen> createState() => _RiskScreenState();
// }
//
// class _RiskScreenState extends State<RiskScreen> {
//   // Sample Risk Data
//   final List<Map<String, dynamic>> risks = [
//     {
//       "id": 1,
//       "asset_id": "FIRE-001",
//       "hazard": "Lift knock",
//       "risk_level": "High",
//       "reported_by": "Asha",
//       "is_solved":false
//     },
//     {
//       "id": 2,
//       "asset_id": "LIFT-002",
//       "hazard": "Lift door malfunction",
//       "risk_level": "Medium",
//       "is_solved":false
//     },
//     {
//       "id": 3,
//       "asset_id": "ELEC-003",
//       "hazard": "Exposed electrical wires",
//       "risk_level": "Critical",
//       "reported_by": "Alex",
//       "is_solved":false
//     },
//     {
//       "id": 4,
//       "asset_id": "BOILER-004",
//       "hazard": "Pressure leakage detected",
//       "risk_level": "High",
//       "reported_by": "Alex",
//       "is_solved":false
//     },
//   ];
//
//   Color getRiskColor(String level) {
//     switch (level) {
//       case "Low":
//         return Colors.green;
//       case "Medium":
//         return Colors.orange;
//       case "High":
//         return Colors.deepOrange;
//       case "Critical":
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   IconData getRiskIcon(String level) {
//     switch (level) {
//       case "Low":
//         return Icons.check_circle;
//       case "Medium":
//         return Icons.warning_amber;
//       case "High":
//         return Icons.report_problem;
//       case "Critical":
//         return Icons.dangerous;
//       default:
//         return Icons.info;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//
//       // appBar: AppBar(
//       //   backgroundColor: const Color(0xFF0000BA),
//       //   foregroundColor: Colors.white,
//       //   title: const Text("Risk Register"),
//       //   elevation: 0,
//       // ),
//
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: risks.length,
//         itemBuilder: (context, index) {
//           final risk = risks[index];
//
//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(18),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 6,
//                   color: Colors.black.withOpacity(0.05),
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//
//             child: Row(
//               children: [
//                 // Risk Icon
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: getRiskColor(
//                       risk["risk_level"],
//                     ).withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     getRiskIcon(risk["risk_level"]),
//                     color: getRiskColor(risk["risk_level"]),
//                     size: 28,
//                   ),
//                 ),
//
//                 const SizedBox(width: 16),
//
//                 // Risk Details
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         risk["hazard"],
//                         style: const TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       const SizedBox(height: 6),
//
//                       Text(
//                         "Asset ID: ${risk["asset_id"]}",
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//
//                       const SizedBox(height: 4),
//
//                       Text(
//                         "Risk ID: #${risk["id"]}",
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Risk Level Badge
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: getRiskColor(
//                       risk["risk_level"],
//                     ).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//
//           child:  TextButton.icon(
//           onPressed: () {
//             Get.to(()=>RisksDetails(risk: {
//               "id": 1,
//               "asset_id": "FIRE-001",
//               "hazard": "Blocked emergency exit",
//               "risk_level": "High",
//               "reported_by": "Alex",
//               "is_solved":false
//             },));
//           },
//           iconAlignment: IconAlignment.end,
//           label:  risk["is_solved"] == true? Text('Solved'): Text(
//           risk["risk_level"],
//           style: TextStyle(
//           color: getRiskColor(risk["risk_level"]),
//           fontWeight: FontWeight.bold,
//           ),
//           ),
//
//           icon: const Icon(
//           Icons.arrow_forward,
//           color: Colors.blue,
//           ),
//           )
//
//
//
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFF0000BA),
//         onPressed: () {
//           Get.to(()=>AddRisks());
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
}