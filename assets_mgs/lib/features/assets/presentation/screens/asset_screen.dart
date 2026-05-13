import 'package:flutter/material.dart';

import 'asset_compliant.dart';

class AssetScreen extends StatelessWidget {
  AssetScreen({super.key});

  // Sample Asset Data
  final List<Map<String, dynamic>> assets = [
    {
      "id": 1,
      "name": "Main Fire Extinguisher",
      "type": "Fire Protection",
      "location": "Block A",
    },
    {
      "id": 2,
      "name": "Passenger Lift",
      "type": "Lift",
      "location": "Building B",
    },
    {
      "id": 3,
      "name": "Main Generator",
      "type": "Electrical",
      "location": "Power Room",
    },
    {
      "id": 4,
      "name": "Steam Boiler",
      "type": "Boiler",
      "location": "Factory Section",
    },
  ];

  IconData getAssetIcon(String type) {
    switch (type) {
      case "Fire Protection":
        return Icons.local_fire_department;
      case "Lift":
        return Icons.elevator;
      case "Electrical":
        return Icons.electrical_services;
      case "Boiler":
        return Icons.precision_manufacturing;
      default:
        return Icons.business;
    }
  }

  Color getAssetColor(String type) {
    switch (type) {
      case "Fire Protection":
        return Colors.red;
      case "Lift":
        return Colors.blue;
      case "Electrical":
        return Colors.orange;
      case "Boiler":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF0000BA),
      //   foregroundColor: Colors.white,
      //   title: const Text("Assets"),
      //   elevation: 0,
      // ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assets.length,
        itemBuilder: (context, index) {
          final asset = assets[index];

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
                // Asset Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getAssetColor(
                      asset["type"],
                    ).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    getAssetIcon(asset["type"]),
                    color: getAssetColor(asset["type"]),
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                // Asset Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset["name"],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Type: ${asset["type"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Location: ${asset["location"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Asset ID Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0000BA).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [


                      TextButton.icon(
                        onPressed: () {
                          assetCompliant();
                        },
                        iconAlignment: IconAlignment.end,
                        label: const Text(
                          "Compliant",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      )
                    ],
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
          // Add Asset
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}