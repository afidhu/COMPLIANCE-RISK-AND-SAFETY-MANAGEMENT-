import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/themes/color_theme.dart';
import '../../../hazards/domain/entities/hazards_entity.dart';
import '../../../../core/utils/date_formater/date_formater.dart';


Future<void> hazardAssetCapa(
    BuildContext context, {
      required HazardsEntity? hazard,
    }) async {
  final Color primaryColor = const Color(0xFF0000BA);

  await Get.bottomSheet(
      Container(
          height: Get.height * .90,
          decoration: BoxDecoration(
            color: themeSurfaceColor(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            /// DRAG HANDLE
            Center(
            child: Container(
            width: 70,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          const SizedBox(height: 25),

          /// HEADER
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.red.shade50,
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 42,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Hazard Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Reported hazard with related asset information",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /////////////////////////////////////////////////////
          /// HAZARD INFORMATION CARD
          /////////////////////////////////////////////////////

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.red.shade100,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Hazard Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20),

                buildAssetTile(
                  icon: Icons.report_problem,
                  title: "Hazard Title",
                  value: hazard?.hazardTitle ?? "-",
                  color: Colors.red,
                ),

                buildAssetTile(
                  icon: Icons.description,
                  title: "Description",
                  value: hazard?.hazardDescription ?? "-",
                  color: Colors.deepOrange,
                ),

                buildAssetTile(
                  icon: Icons.calendar_month,
                  title: "Reported Date",
                  value: dateFormater(
                    hazard?.createdAt.toString() ?? "",
                  ),
                  color: Colors.indigo,
                ),

                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: const Icon(
                          Icons.verified,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Text(
                          "Current Status",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      buildStatusBadge(
                        hazard?.status ?? "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /////////////////////////////////////////////////////
          /// ASSET INFORMATION
          /////////////////////////////////////////////////////

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.blue.shade100,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.apartment,
                      color: Colors.blue,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Asset Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20),

                buildAssetTile(
                  icon: Icons.precision_manufacturing,
                  title: "Asset Name",
                  value: hazard?.asset?.assetName ?? "-",
                  color: Colors.orange,
                ),

                buildAssetTile(
                  icon: Icons.category,
                  title: "Asset Type",
                  value: hazard?.asset?.assetType ?? "-",
                  color: Colors.green,
                ),

                buildAssetTile(
                  icon: Icons.location_on,
                  title: "Location",
                  value: hazard?.asset?.location ?? "-",
                  color: Colors.red,
                ),

                buildAssetTile(
                  icon: Icons.qr_code,
                  title: "Serial Number",
                  value: hazard?.asset?.serialNo ?? "N/A",
                  color: Colors.purple,
                ),

                buildAssetTile(
                  icon: Icons.verified_user,
                  title: "Asset Status",
                  value: hazard?.asset?.status ?? "-",
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),

                /////////////////////////////////////////////////////
                /// CLOSE BUTTON
                /////////////////////////////////////////////////////

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
      ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

///////////////////////////////////////////////////////////////
/// STATUS BADGE
///////////////////////////////////////////////////////////////

Widget buildStatusBadge(String status) {
  Color bgColor;
  Color textColor;

  switch (status.toUpperCase()) {
    case "OPEN":
      bgColor = Colors.red.shade100;
      textColor = Colors.red;
      break;

    case "IN_PROGRESS":
      bgColor = Colors.orange.shade100;
      textColor = Colors.orange.shade800;
      break;

    case "CLOSED":
      bgColor = Colors.green.shade100;
      textColor = Colors.green;
      break;

    default:
      bgColor = Colors.grey.shade200;
      textColor = Colors.grey.shade700;
  }

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      status,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

///////////////////////////////////////////////////////////////
/// REUSABLE INFORMATION TILE
///////////////////////////////////////////////////////////////

Widget buildAssetTile({
  required IconData icon,
  required String title,
  required String value,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color.withOpacity(.15),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          value.isEmpty ? "-" : value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}
