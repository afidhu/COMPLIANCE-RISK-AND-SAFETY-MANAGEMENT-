import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../assets/domain/entities/assets_entity.dart';
import '../bloc/risks_bloc.dart';
import 'add_risks.dart';

class RiskScreen extends StatefulWidget {
  final String hazardId;
  const RiskScreen({super.key, required this.hazardId});

  @override
  State<RiskScreen> createState() => _RiskScreenState();
}

class _RiskScreenState extends State<RiskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (2 == 2) {
      // context.read<RisksBloc>().add(GetRiskAllEvent());
    }
  }

  Color getRiskColor(String severity) {
    switch (severity) {
      case "OPEN":
        return Colors.green;

      case "MITIGATED":
        return Colors.orange;

      case "CLOSED":
        return Colors.deepOrange;

      case "Critical":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }


  Color getStatusColor(String status) {
    switch (status) {
      case "OPEN":
        return Colors.red;

      case "MITIGATED":
        return Colors.orange;
      case "Mitigating":
        return Colors.deepOrange;

      case "CLOSED":
        return Colors.green;

      default:
        return Colors.grey;
    }
  }

  IconData getRiskIcon(String severity) {
    switch (severity) {
      case "LOW":
        return Icons.check_circle;

      case "MEDIUM":
        return Icons.warning_amber;

      case "HIGH":
        return Icons.report_problem;

      case "CRITICAL":
        return Icons.dangerous;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      body: RefreshIndicator(
        onRefresh: () async {
          context.read<RisksBloc>().add(GetRiskEvent(widget.hazardId));
        },
        child: BlocBuilder<RisksBloc, RisksState>(
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
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Color(0xFFF8FAFC),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Column(
                          children: [

                            /// TOP SEVERITY LINE
                            Container(
                              height: 5,
                              color: getRiskColor(
                                risk.severity.toString(),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                children: [

                                  /// HEADER
                                  Row(
                                    children: [

                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: getRiskColor(
                                            risk.severity.toString(),
                                          ).withOpacity(.12),
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        child: Icon(
                                          getRiskIcon(
                                            risk.severity.toString(),
                                          ),
                                          size: 28,
                                          color: getRiskColor(
                                            risk.severity.toString(),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 14),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [

                                            Text(
                                              risk.riskTitle.toString(),
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w700,
                                                height: 1.3,
                                              ),
                                            ),

                                            const SizedBox(height: 4),

                                            Text(
                                              "Risk Assessment",
                                              style: TextStyle(
                                                color:
                                                Colors.grey.shade600,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: getRiskColor(
                                            risk.severity.toString(),
                                          ).withOpacity(.12),
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          risk.severity.toString(),
                                          style: TextStyle(
                                            color: getRiskColor(
                                              risk.severity.toString(),
                                            ),
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  /// INFO AREA
                                  Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius:
                                      BorderRadius.circular(18),
                                    ),
                                    child: Column(
                                      children: [

                                        _modernInfoRow(
                                          Icons.analytics_outlined,
                                          "Likelihood",
                                          risk.likelihood.toString(),
                                        ),

                                        const Divider(),

                                        _modernInfoRow(
                                          Icons.priority_high,
                                          "Severity",
                                          risk.severity.toString(),
                                        ),

                                        const Divider(),

                                        _modernInfoRow(
                                          Icons.flag_outlined,
                                          "Status",
                                          risk.status.toString(),
                                          valueColor:
                                          getStatusColor(
                                            risk.status.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ASSET PREVIEW
                                  Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(18),
                                      color: const Color(
                                        0xFF0000BA,
                                      ).withOpacity(.05),
                                    ),
                                    child: Row(
                                      children: [

                                        const Icon(
                                          Icons.apartment,
                                          color: Color(0xFF0000BA),
                                        ),

                                        const SizedBox(width: 10),

                                        Expanded(
                                          child: Text(
                                            risk.hazard?.asset
                                                ?.assetName ??
                                                "No Asset",
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            style:
                                            const TextStyle(
                                              fontWeight:
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  /// BUTTONS
                                  Row(
                                    children: [

                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: () {
                                            assetDetails(
                                              risk.hazard!.asset,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.visibility,
                                            size: 18,
                                          ),
                                          label: const Text(
                                            "View Asset",
                                          ),
                                          style:
                                          OutlinedButton.styleFrom(
                                            foregroundColor:
                                            const Color(
                                              0xFF0000BA,
                                            ),
                                            // backgroundColor: Colors.blue[700],
                                            side:
                                            const BorderSide(
                                              color:
                                              Color(0xFF0000BA),
                                            ),
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          // Add Risk
          Get.to(() => AddRisks(hazardId: widget.hazardId));
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }


  Future assetDetails(AssetsEntity? asset) async {
    final dateFormat = dateFormater(asset!.createdAt.toString());
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: 55,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(
                    0xFF0000BA,
                  ).withOpacity(.08),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  size: 40,
                  color: Color(0xFF0000BA),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Asset Information",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              _modernDetailTile(
                Icons.inventory_2_outlined,
                "Asset Name",
                asset.assetName.toString(),
              ),

              _modernDetailTile(
                Icons.category_outlined,
                "Asset Type",
                asset.assetType.toString(),
              ),

              _modernDetailTile(
                Icons.location_on_outlined,
                "Location",
                asset.location.toString(),
              ),

              _modernDetailTile(
                Icons.qr_code,
                "Serial No",
                asset.serialNo.toString(),
              ),

              _modernDetailTile(
                Icons.verified_outlined,
                "Status",
                asset.status.toString(),
              ),

              _modernDetailTile(
                Icons.calendar_month_outlined,
                "Created",
                dateFormat,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _modernDetailTile(IconData icon,
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


  Widget _modernInfoRow(
      IconData icon,
      String label,
      String value, {
        Color? valueColor,
      }) {
    return Row(
      children: [

        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: const Color(
              0xFF0000BA,
            ).withOpacity(.08),
            borderRadius:
            BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(
              0xFF0000BA,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ),

        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
      ],
    );
  }

}