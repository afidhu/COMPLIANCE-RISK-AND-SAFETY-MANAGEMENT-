import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> assetCompliant() async {
  final Color primaryColor = const Color(0xFF0D47A1);

  final List<Map<String, String>> compliances = [
    {
      "compliance_id": "CMP-001",
      "asset_id": "AST-001",
      "compliance_name": "Electrical Safety Inspection",
      "frequency": "Yearly",
      "last_due": "2025-12-12",
      "due_date": "2026-12-12",
      "status": "Compliant",
    },
    {
      "compliance_id": "CMP-002",
      "asset_id": "AST-002",
      "compliance_name": "Monthly Operational Test",
      "frequency": "Monthly",
      "last_due": "2026-05-01",
      "due_date": "2026-06-01",
      "status": "Pending",
    },
    {
      "compliance_id": "CMP-003",
      "asset_id": "AST-003",
      "compliance_name": "Fuel System Inspection",
      "frequency": "Yearly",
      "last_due": "2025-10-15",
      "due_date": "2026-10-15",
      "status": "Compliant",
    },
    {
      "compliance_id": "CMP-004",
      "asset_id": "AST-004",
      "compliance_name": "Emergency Backup Test",
      "frequency": "Quarterly",
      "last_due": "2026-01-10",
      "due_date": "2026-04-10",
      "status": "Overdue",
    },
    {
      "compliance_id": "CMP-005",
      "asset_id": "AST-005",
      "compliance_name": "Maintenance Certification",
      "frequency": "Yearly",
      "last_due": "2025-08-20",
      "due_date": "2026-08-20",
      "status": "Pending",
    },
  ];

  await Get.bottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,

    Container(
      height: Get.height * .85,

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),

      child: Column(
        children: [
          /// TOP INDICATOR
          Center(
            child: Container(
              width: 70,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// HEADER
          Row(
            children: [
              CircleAvatar(
                radius: 26,

                backgroundColor:
                primaryColor.withOpacity(0.1),

                child: Icon(
                  Icons.verified_user,
                  color: primaryColor,
                  size: 30,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Generator Compliance",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    Text(
                      "${compliances.length} Compliance Records",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius:
                  BorderRadius.circular(12),
                ),

                child: Text(
                  "${compliances.length}",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 25),

          /// LIST
          Expanded(
            child: ListView.builder(
              itemCount: compliances.length,

              itemBuilder: (context, index) {
                final compliance =
                compliances[index];

                Color statusColor;

                switch (compliance["status"]) {
                  case "Compliant":
                    statusColor = Colors.green;
                    break;

                  case "Pending":
                    statusColor = Colors.orange;
                    break;

                  default:
                    statusColor = Colors.red;
                }

                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(18),

                    border: Border.all(
                      color:
                      statusColor.withOpacity(.25),
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets.all(16),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                compliance[
                                "compliance_name"]!,
                                style:
                                const TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            Container(
                              padding:
                              const EdgeInsets
                                  .symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              decoration:
                              BoxDecoration(
                                color: statusColor
                                    .withOpacity(.1),

                                borderRadius:
                                BorderRadius
                                    .circular(
                                    30),
                              ),

                              child: Text(
                                compliance[
                                "status"]!,
                                style: TextStyle(
                                  color:
                                  statusColor,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 15),

                        _rowItem(
                          Icons.badge,
                          "Compliance ID",
                          compliance[
                          "compliance_id"]!,
                          primaryColor,
                        ),

                        _rowItem(
                          Icons.inventory_2,
                          "Asset ID",
                          compliance[
                          "asset_id"]!,
                          primaryColor,
                        ),

                        _rowItem(
                          Icons.repeat,
                          "Frequency",
                          compliance[
                          "frequency"]!,
                          primaryColor,
                        ),

                        _rowItem(
                          Icons.history,
                          "Last Due Date",
                          compliance[
                          "last_due"]!,
                          primaryColor,
                        ),

                        _rowItem(
                          Icons.calendar_month,
                          "Due Date",
                          compliance[
                          "due_date"]!,
                          primaryColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// BUTTONS
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.back();
                  },

                  style:
                  OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          14),
                    ),

                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 14,
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
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},

                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    primaryColor,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          14),
                    ),

                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),

                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Export",
                    style: TextStyle(
                      color: Colors.white,
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
    ),
  );
}

Widget _rowItem(
    IconData icon,
    String title,
    String value,
    Color color,
    ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),

    child: Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),

        const SizedBox(width: 10),

        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}