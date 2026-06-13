import 'package:assets_mgs/features/hazards/presentation/screens/register_hazards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CAPA/presentation/bloc/capa_bloc.dart';
import '../../../compliances/presentation/screens/compliance_screen.dart';
import '../../../mitigations/presentation/bloc/mitigation_bloc.dart';
import '../../../risks/presentation/bloc/risks_bloc.dart';
import '../../../risks/presentation/screens/Risk_screen.dart';
import '../../../risks/presentation/screens/add_risks.dart';
import '../../../risks/presentation/screens/risks_details.dart';
import '../bloc/hazards_bloc.dart';

class Hazards extends StatefulWidget {
  const Hazards({super.key});

  @override
  State<Hazards> createState() => _HazardsState();
}

class _HazardsState extends State<Hazards> {

  /// SAMPLE HAZARD DATA
  // final List<Map<String, dynamic>> hazards = [
  //
  //   {
  //     "hazard_id": 1,
  //     "asset_id": "LIFT-001",
  //     "compliance_id": "COMP-101",
  //     "hazard_title": "Lift Door Malfunction",
  //     "hazard_description":
  //     "Lift doors are not closing properly and may trap passengers.",
  //     "reported_by": "Inspector Juma",
  //     "status": "Open",
  //     "created_at": "2026-05-20",
  //   },
  //
  //   {
  //     "hazard_id": 2,
  //     "asset_id": "FIRE-002",
  //     "compliance_id": null,
  //     "hazard_title": "Lift inspection overdue",
  //     "hazard_description":
  //     "Emergency exit blocked by stored materials.",
  //     "reported_by": "System",
  //     "status": "Closed",
  //     "created_at": "2026-05-21",
  //   },
  //
  //   {
  //     "hazard_id": 3,
  //     "asset_id": "ELEC-003",
  //     "compliance_id": "COMP-104",
  //     "hazard_title": "Exposed Electrical Wires",
  //     "hazard_description":
  //     "Live wires exposed near office entrance.",
  //     "reported_by": "Alex",
  //     "status": "In Progress",
  //     "created_at": "2026-05-22",
  //   },
  //
  //   {
  //     "hazard_id": 4,
  //     "asset_id": "BOILER-004",
  //     "compliance_id": null,
  //     "hazard_title": "Pressure Leakage",
  //     "hazard_description":
  //     "Boiler pressure valve leaking steam.",
  //     "reported_by": "System",
  //     "status": "Closed",
  //     "created_at": "2026-05-24",
  //   },
  // ];

  Color getStatusColor(String status) {
    switch (status) {
      case "OPEN":
        return Colors.orange;

      case "Critical":
        return Colors.red;

      case "IN_PROGRESS":
        return Colors.blue;

      case "CLOSED":
        return Colors.green;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HazardsBloc>().add(GetHazardsEvent());
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

      body: BlocBuilder<HazardsBloc, HazardsState>(
        builder: (context, state) {
          if(state is HazardsLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is HazardsError){
            return Text(state.errorMessage.toString());
          }
          else if  (state is HazardsLoaded){

            return ListView.builder(

              padding: const EdgeInsets.all(16),

              itemCount:state.hazards.length,

              itemBuilder: (context, index) {
                final hazard =state.hazards[index];
                print('reportedBy: ${hazard}');
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
                                hazard.status.toString(),
                              ).withOpacity(0.1),

                              shape: BoxShape.circle,
                            ),

                            child: Icon(

                              getStatusIcon(
                                hazard.status.toString(),
                              ),

                              color: getStatusColor(
                                hazard.status.toString(),
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

                                  hazard.hazardTitle.toString(),

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
                        hazard.hazardDescription.toString(),
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
                            "Asset: ${hazard.asset?.assetName}",
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
                            "Reported By:${hazard.reportedBy?.fullName} ",
                          ),
                          Spacer(),
                          TextButton(

                            onPressed: () {
                              // Risk Details

                              assetDetails({

                                "asset_id": "AST-001",

                                "asset_name": "Passenger Lift",

                                "asset_type": "Lift",

                                "location": "Block A",

                                "serial_no": "LFT-2026-001",

                                "status": "Active",

                                "created_by": "Admin",
                              });
                            },




                            // label:Icon(Icons.remove_red_eye_outlined),

                            child: Icon(Icons.remove_red_eye_outlined),
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
                            "Created: ${hazard.createdAt}",
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
                                hazard.status.toString(),
                              ).withOpacity(0.1),

                              borderRadius:
                              BorderRadius.circular(8),
                            ),

                            child: TextButton.icon(
                              onPressed: () {
                                context.read<RisksBloc>().add(GetRiskEvent(hazard.hazardId!.trim().toString()));
                                context.read<MitigationBloc>().add(GetMitigation(hazard.hazardId!.trim().toString()));
                                context.read<CapaBloc>().add(GetCapaEvent(hazard.hazardId!.trim().toString()));
                                AddRisks(hazardId: hazard.hazardId!.trim().toString(),);
                                Get.to(() => RisksDetails(),arguments:hazard.hazardId!.trim().toString() );
                              },
                              icon: Icon(Icons.arrow_forward, color: Colors.blue,
                                size: 10.sp,),
                              iconAlignment: IconAlignment.end,
                              label:
                              Text(

                                hazard.status.toString(),

                                style: TextStyle(
                                  color: getStatusColor(
                                    hazard.status.toString(),
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
            );
          }
          return SizedBox.shrink();
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          /// Add Hazard
          Get.to(() => RegisterHazards());
          // Get.to(()=>ComplianceScreen());
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

}