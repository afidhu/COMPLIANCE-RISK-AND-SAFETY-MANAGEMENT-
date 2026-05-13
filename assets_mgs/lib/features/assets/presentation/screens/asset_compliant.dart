import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> assetCompliant() async {

  final Color primaryColor = const Color(0xFF0D47A1);

  await Get.bottomSheet(

    isScrollControlled: true,

    backgroundColor: Colors.transparent,

    Container(

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),

      child: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// TOP INDICATOR
            Center(
              child: Container(
                width: 60,
                height: 5,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
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
                    Icons.verified,
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
                      "Certification Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    Text(
                      "Compliance Information",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 25),

            /// CERTIFICATE DETAILS
            buildInfoTile(
              icon: Icons.badge,
              title: "Certificate ID",
              value: "CERT-2026-001",
              color: primaryColor,
            ),

            buildInfoTile(
              icon: Icons.precision_manufacturing,
              title: "Asset ID",
              value: "AST-001",
              color: primaryColor,
            ),

            buildInfoTile(
              icon: Icons.description,
              title: "Certificate Name",
              value: "Lift Safety Certificate",
              color: primaryColor,
            ),

            buildInfoTile(
              icon: Icons.calendar_month,
              title: "Expiry Date",
              value: "12/12/2026",
              color: primaryColor,
            ),

            buildInfoTile(
              icon: Icons.verified_user,
              title: "Compliance Status",
              value: "Compliant",
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            /// ACTION BUTTONS
            Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(

                    onPressed: () {
                      Get.back();
                    },

                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor,
                      ),

                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),

                    icon: Icon(
                      Icons.close,
                      color: primaryColor,
                    ),

                    label: Text(
                      "Close",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: ElevatedButton.icon(

                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,

                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),

                    icon: const Icon(
                      Icons.download,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Download",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

/// REUSABLE INFO TILE
Widget buildInfoTile({
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

      borderRadius: BorderRadius.circular(14),
    ),

    child: Row(

      children: [

        CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}