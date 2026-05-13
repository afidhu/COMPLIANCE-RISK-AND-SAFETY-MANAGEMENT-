
import 'package:flutter/material.dart';

class InspectionScreen extends StatelessWidget {
  InspectionScreen({super.key});

  // Sample Inspection Data
  final List<Map<String, dynamic>> inspections = [
    {
      "id": 1,
      "asset_id": "FIRE-001",
      "date": "2026-05-10",
      "status": "Completed",
    },
    {
      "id": 2,
      "asset_id": "LIFT-002",
      "date": "2026-05-15",
      "status": "Pending",
    },
    {
      "id": 3,
      "asset_id": "ELEC-003",
      "date": "2026-05-18",
      "status": "Overdue",
    },
    {
      "id": 4,
      "asset_id": "BOILER-004",
      "date": "2026-05-20",
      "status": "Completed",
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Overdue":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Completed":
        return Icons.check_circle;
      case "Pending":
        return Icons.pending;
      case "Overdue":
        return Icons.warning;
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
      //   title: const Text("Inspections"),
      //   elevation: 0,
      // ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: inspections.length,
        itemBuilder: (context, index) {
          final inspection = inspections[index];

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
                // Leading Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getStatusColor(
                      inspection["status"],
                    ).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    getStatusIcon(inspection["status"]),
                    color: getStatusColor(inspection["status"]),
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Inspection #${inspection["id"]}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Asset ID: ${inspection["asset_id"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Date: ${inspection["date"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(
                      inspection["status"],
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    inspection["status"],
                    style: TextStyle(
                      color: getStatusColor(inspection["status"]),
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
          // Add Inspection
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}