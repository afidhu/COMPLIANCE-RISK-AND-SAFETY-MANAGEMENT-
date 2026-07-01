import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:assets_mgs/features/hazards/presentation/screens/register_hazards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../CAPA/presentation/bloc/capa_bloc.dart';
import '../../../assets/domain/entities/assets_entity.dart';
import '../../../mitigations/presentation/bloc/mitigation_bloc.dart';
import '../../../risks/presentation/bloc/risks_bloc.dart';
import '../../../risks/presentation/screens/add_risks.dart';
import '../../../risks/presentation/screens/risks_details.dart';
import '../bloc/hazards_bloc.dart';

class Hazards extends StatefulWidget {
  const Hazards({super.key});

  @override
  State<Hazards> createState() => _HazardsState();
}

class _HazardsState extends State<Hazards> {
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


      backgroundColor:themeSurfaceColor(context),

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
                  decoration: BoxDecoration(
                    color:themeSurfaceColor(context),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// HEADER
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: getStatusColor(
                                  hazard.status.toString(),
                                ).withOpacity(0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                getStatusIcon(
                                  hazard.status.toString(),
                                ),
                                color: getStatusColor(
                                  hazard.status.toString(),
                                ),
                                size: 22,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Text(
                                hazard.hazardTitle.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: getStatusColor(
                                  hazard.status.toString(),
                                ).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                hazard.status.toString().toLowerCase(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: getStatusColor(
                                    hazard.status.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        /// DESCRIPTION
                        Text(
                          hazard.hazardDescription.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Divider(
                          color: Colors.grey.shade200,
                          thickness: 1,
                        ),

                        const SizedBox(height: 12),

                        /// ASSET
                        Row(
                          children: [
                            const Icon(
                              Icons.inventory_2_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                hazard.asset?.assetName ?? "N/A",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        /// REPORTED BY
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              size: 18,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                hazard.reportedBy?.fullName ?? "Unknown",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            IconButton(
                              tooltip: "View Asset",
                              onPressed: () {
                                assetDetails(hazard.asset);
                              },
                              icon: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF0000BA),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        /// FOOTER
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 18,
                              color: Colors.purple,
                            ),
                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                dateFormater(hazard.createdAt.toString()),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),

                            ElevatedButton.icon(
                              iconAlignment: IconAlignment.end,
                              onPressed: () {
                                context.read<RisksBloc>().add(
                                  GetRiskEvent(
                                    hazard.hazardId!.trim(),
                                  ),
                                );

                                context.read<MitigationBloc>().add(
                                  GetMitigation(
                                    hazard.hazardId!.trim(),
                                  ),
                                );

                                context.read<CapaBloc>().add(
                                  GetCapaEvent(
                                    hazard.hazardId!.trim(),
                                  ),
                                );

                                Get.to(
                                      () => RisksDetails(),
                                  arguments: hazard.hazardId!.trim(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0000BA),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 16,
                              ),
                              label: const Text(
                                "View Risks",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
  Future assetDetails(AssetsEntity? asset) async {
    final dateFormat = dateFormater(asset!.createdAt.toString());
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

            // detailTile(
            //   Icons.qr_code,
            //   "Asset ID",
            //   asset["asset_id"],
            // ),

            detailTile(
              Icons.inventory,
              "Asset Name",
              asset!.assetName.toString(),
            ),

            detailTile(
              Icons.category,
              "Asset Type",
              asset.assetType.toString(),
            ),

            detailTile(
              Icons.location_on,
              "Location",
              asset.location.toString(),
            ),

            detailTile(
              Icons.confirmation_number,
              "Serial No",
              asset.serialNo.toString()?? "N/A",
            ),

            detailTile(
              Icons.verified,
              "Status",
              asset.status.toString(),
            ),

            detailTile(
              Icons.calendar_month_outlined,
              "Created At",
              dateFormat,
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