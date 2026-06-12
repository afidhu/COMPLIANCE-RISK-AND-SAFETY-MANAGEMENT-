import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bloc/compliance_bloc.dart';
import 'add_compliance.dart';

class ComplianceScreen extends StatefulWidget {
  const ComplianceScreen({super.key});

  @override
  State<ComplianceScreen> createState() => _ComplianceScreenState();
}

class _ComplianceScreenState extends State<ComplianceScreen> {

  // final List<Map<String, dynamic>> compliances = [
  //   {
  //     "compliance_id": 1,
  //     "asset_id": "FIRE-001",
  //     "compliance_name": "Fire Extinguisher Inspection",
  //     "frequency": "Monthly",
  //     "last_due_date": "2026-04-01",
  //     "due_date": "2026-05-01",
  //     "status": "Compliant",
  //   },
  //
  //   {
  //     "compliance_id": 2,
  //     "asset_id": "LIFT-002",
  //     "compliance_name": "Lift Safety Inspection",
  //     "frequency": "Quarterly",
  //     "last_due_date": "2026-01-15",
  //     "due_date": "2026-04-15",
  //     "status": "Overdue",
  //   },
  //
  //   {
  //     "compliance_id": 3,
  //     "asset_id": "BOILER-003",
  //     "compliance_name": "Boiler Certification",
  //     "frequency": "Yearly",
  //     "last_due_date": "2025-06-01",
  //     "due_date": "2026-06-01",
  //     "status": "Due Soon",
  //   },
  //
  //   {
  //     "compliance_id": 4,
  //     "asset_id": "ELEC-004",
  //     "compliance_name": "Electrical Inspection",
  //     "frequency": "Monthly",
  //     "last_due_date": "2026-04-10",
  //     "due_date": "2026-05-10",
  //     "status": "Compliant",
  //   },
  // ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Compliant":
        return Colors.green;

      case "Due Soon":
        return Colors.pinkAccent;

      case "Overdue":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Compliant":
        return Icons.verified;

      case "Due Soon":
        return Icons.timer;

      case "Overdue":
        return Icons.warning_amber_rounded;

      default:
        return Icons.info;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ComplianceBloc>().add(GetComplianceEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 8,
      //   centerTitle: true,
      //
      //   // backgroundColor: Colors.blue.shade900,
      //   foregroundColor: Colors.white,
      //   backgroundColor: const Color(0xFF0000BA),
      //   title: const Text(
      //     "Facilities Compliance",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //
      //   actions: [
      //
      //     // IconButton(
      //     //   onPressed: () {},
      //     //   icon: const Icon(Icons.search),
      //     // ),
      //
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.more_vert),
      //     ),
      //   ],
      // ),

      backgroundColor: const Color(0xFFF5F7FA),

      body: BlocBuilder<ComplianceBloc, ComplianceState>(
        builder: (context, state) {
          if(state is ComplianceLoading){
            return CircularProgressIndicator();
          }
          else if (state is ComplianceMessage){
            return Text(state.message.toString());
          }
          else if(state is ComplianceLoaded){
          return ListView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: state.compliance.length,

            itemBuilder: (context, index) {
              final compliance = state.compliance[index];

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

                  children: [

                    Row(

                      children: [

                        Container(

                          padding: const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            color: getStatusColor(
                              compliance.status.toString(),
                            ).withOpacity(0.1),

                            shape: BoxShape.circle,
                          ),

                          child: Icon(

                            getStatusIcon(
                              compliance.status.toString(),
                            ),

                            color: getStatusColor(
                              compliance.status.toString(),
                            ),

                            size: 20.sp,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(

                                compliance.complianceName.toString(),

                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4.h),

                              Text(
                                "Asset: ${compliance.asset!.assetName}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(

                          padding:
                          EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 5,
                          ),

                          decoration: BoxDecoration(

                            color: getStatusColor(
                              compliance.status.toString(),
                            ).withOpacity(0.1),

                            borderRadius:
                            BorderRadius.circular(20),
                          ),

                          child: Text(

                            compliance.status.toString(),

                            style: TextStyle(
                              color: getStatusColor(
                                compliance.status.toString(),
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Divider(),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.repeat,
                          size: 18,
                          color: Colors.blue,
                        ),

                        const SizedBox(width: 8),

                        Text(
                          "Frequency: ${compliance.frequency}",
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.history,
                          size: 18,
                          color: Colors.orange,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            "Last Due Date: ${compliance.lastDueDate}",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: Colors.red,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            "Next Due Date: ${compliance.dueDate}",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Align(

                      alignment: Alignment.centerRight,

                      child: TextButton.icon(

                        onPressed: () {

                          /// Open Compliance Details
                        },

                        iconAlignment: IconAlignment.end,

                        label: const Text(
                          "View Details",
                          style: TextStyle(
                            color: Color(0xFF0000BA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF0000BA),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          };
          return SizedBox.shrink();
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),

        onPressed: () {
          /// Add Compliance
          Get.to(() => AddCompliance());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}