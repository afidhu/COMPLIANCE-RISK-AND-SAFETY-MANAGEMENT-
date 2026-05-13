import 'package:flutter/material.dart';


class CertificateScreen extends StatelessWidget {
  CertificateScreen({super.key});

  final List<Map<String, dynamic>> certificates = [
    {
      "id": 1,
      "asset_id": "FIRE-001",
      "expiry_date": "2026-06-10",
    },
    {
      "id": 2,
      "asset_id": "LIFT-002",
      "expiry_date": "2026-05-20",
    },
    {
      "id": 3,
      "asset_id": "ELEC-003",
      "expiry_date": "2026-04-15",
    },
  ];

  Color getExpiryColor(String date) {
    final expiry = DateTime.parse(date);
    final now = DateTime.now();

    if (expiry.isBefore(now)) {
      return Colors.red;
    } else if (expiry.difference(now).inDays <= 30) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  String getExpiryStatus(String date) {
    final expiry = DateTime.parse(date);
    final now = DateTime.now();

    if (expiry.isBefore(now)) {
      return "Expired";
    } else if (expiry.difference(now).inDays <= 30) {
      return "Expiring Soon";
    } else {
      return "Valid";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        title: const Text("Certificates"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: certificates.length,
        itemBuilder: (context, index) {
          final certificate = certificates[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: getExpiryColor(
                    certificate["expiry_date"],
                  ).withOpacity(0.1),
                  child: Icon(
                    Icons.verified,
                    color: getExpiryColor(certificate["expiry_date"]),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Asset: ${certificate["asset_id"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Expiry Date: ${certificate["expiry_date"]}",
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: getExpiryColor(
                      certificate["expiry_date"],
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    getExpiryStatus(certificate["expiry_date"]),
                    style: TextStyle(
                      color: getExpiryColor(certificate["expiry_date"]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
