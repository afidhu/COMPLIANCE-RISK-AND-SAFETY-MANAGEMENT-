import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// HEADER
                      Row(
                        children: [

                          /// ICON
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: getStatusColor(
                                compliance.status.toString(),
                              ).withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              getStatusIcon(
                                compliance.status.toString(),
                              ),
                              color: getStatusColor(
                                compliance.status.toString(),
                              ),
                              size: 20,
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// TITLE + ASSET
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  compliance.complianceName.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  "Asset: ${compliance.asset?.assetName ?? 'N/A'}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// STATUS CHIP
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: getStatusColor(
                                compliance.status.toString(),
                              ).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              compliance.status.toString(),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: getStatusColor(
                                  compliance.status.toString(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Divider(color: Colors.grey.shade200),

                      const SizedBox(height: 10),

                      /// FREQUENCY
                      Row(
                        children: [
                          const Icon(Icons.repeat, size: 18, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Frequency: ${compliance.frequency}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// LAST DUE DATE
                      Row(
                        children: [
                          const Icon(Icons.history, size: 18, color: Colors.orange),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Last Due: ${dateFormater(compliance.lastDueDate.toString())}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// NEXT DUE DATE
                      Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 18, color: Colors.red),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Next Due: ${dateFormater(compliance.dueDate.toString())}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// BUTTON
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          iconAlignment: IconAlignment.end,
                          onPressed: () {
                            /// Open Compliance Details
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF0000BA),
                            size: 18,
                          ),
                          label: const Text(
                            "View",
                            style: TextStyle(
                              color: Color(0xFF0000BA),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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