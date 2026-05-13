import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'add_mitigation.dart';
class AllMitigations extends StatelessWidget {
  final List<Map<String, dynamic>> mitigations;
  const AllMitigations({super.key, required this.mitigations});

  final Color primaryColor = const Color(0xFF0000BA);

  /// SAMPLE MITIGATION DATA
  ///  {
  //       "mitigation_id": 1,
  //       "risk_id": 1,
  //       "mitigation_name": "Close lift immediately",
  //       "created_date": "12/05/2026"
  //     },

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: mitigations.length,

        itemBuilder: (context, index) {

          final item = mitigations[index];

          return Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor:
                Colors.orange.withOpacity(0.1),

                child: const Icon(
                  Icons.shield,
                  color: Colors.orange,
                ),
              ),

              title: Text(
                item["mitigation_name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                "Created: ${item["created_date"]}",
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,

        onPressed: () {
          Get.to(()=>AddMitigation());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

