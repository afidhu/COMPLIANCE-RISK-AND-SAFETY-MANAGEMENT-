import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'add_risks.dart';

class RiskScreen extends StatelessWidget {
  RiskScreen({super.key});

  // Sample Risk Data
  final List<Map<String, dynamic>> risks = [
    {
      "id": 1,
      "asset_id": "FIRE-001",
      "hazard": "Blocked emergency exit",
      "risk_level": "High",
    },
    {
      "id": 2,
      "asset_id": "LIFT-002",
      "hazard": "Lift door malfunction",
      "risk_level": "Medium",
    },
    {
      "id": 3,
      "asset_id": "ELEC-003",
      "hazard": "Exposed electrical wires",
      "risk_level": "Critical",
    },
    {
      "id": 4,
      "asset_id": "BOILER-004",
      "hazard": "Pressure leakage detected",
      "risk_level": "High",
    },
  ];

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
      //   backgroundColor: const Color(0xFF0000BA),
      //   foregroundColor: Colors.white,
      //   title: const Text("Risk Register"),
      //   elevation: 0,
      // ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: risks.length,
        itemBuilder: (context, index) {
          final risk = risks[index];

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

            child: Row(
              children: [
                // Risk Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getRiskColor(
                      risk["risk_level"],
                    ).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    getRiskIcon(risk["risk_level"]),
                    color: getRiskColor(risk["risk_level"]),
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                // Risk Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        risk["hazard"],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Asset ID: ${risk["asset_id"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Risk ID: #${risk["id"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Risk Level Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: getRiskColor(
                      risk["risk_level"],
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    risk["risk_level"],
                    style: TextStyle(
                      color: getRiskColor(risk["risk_level"]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          Get.to(()=>AddRisks());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}