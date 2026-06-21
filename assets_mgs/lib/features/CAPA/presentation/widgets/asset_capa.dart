import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/domain/entities/assets_entity.dart';

Future<void> assetCapa({required AssetsEntity? asset,}) async {

  final Color primaryColor = const Color(0xFF0000BA);

  await Get.bottomSheet(

    isScrollControlled: true,

    backgroundColor: Colors.transparent,

    Container(

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// TOP LINE
          Center(
            child: Container(
              width: 70,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,

                borderRadius:
                BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// TITLE
          Row(
            children: [

              CircleAvatar(
                radius: 24,

                backgroundColor:
                primaryColor.withOpacity(0.1),

                child: Icon(
                  Icons.inventory_2,
                  color: primaryColor,
                  size: 28,
                ),
              ),

              const SizedBox(width: 14),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "Asset Details",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),

                  Text(
                    "Asset Information",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              )
            ],
          ),

          /// ASSET NAME
          buildAssetTile(
            icon: Icons.precision_manufacturing,
            title: "Asset Name",
            value: asset!.assetName.toString(),
            color: Colors.orange,
          ),

          /// TYPE
          buildAssetTile(
            icon: Icons.category,
            title: "Asset Type",
            value: asset.assetType.toString(),
            color: Colors.green,
          ),

          /// LOCATION
          buildAssetTile(
            icon: Icons.location_on,
            title: "Location",
            value: asset.location.toString(),
            color: Colors.red,
          ),

          /// STATUS
          buildAssetTile(
            icon: Icons.verified,
            title: "Status",
            value: asset.status.toString(),
            color: Colors.blue,
          ),

          const SizedBox(height: 25),

          /// CLOSE BUTTON
          SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton.icon(

              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(14),
                ),
              ),

              onPressed: () {
                Get.back();
              },

              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),

              label: const Text(
                "Close",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// REUSABLE TILE
Widget buildAssetTile({
  required IconData icon,
  required String title,
  required String value,
  required Color color,
}) {

  return Container(

    margin: const EdgeInsets.only(bottom: 14),

    padding: const EdgeInsets.all(14),

    decoration: BoxDecoration(
      color: Colors.grey.shade100,

      borderRadius: BorderRadius.circular(16),
    ),

    child: Row(

      children: [

        CircleAvatar(
          backgroundColor:
          color.withOpacity(0.1),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}