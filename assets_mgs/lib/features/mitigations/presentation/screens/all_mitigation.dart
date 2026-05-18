import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CAPA/presentation/widgets/asset_capa.dart';
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
              trailing:TextButton.icon(onPressed: (){assetCapa(asset:{
                "id": 1,
                "name": "Main Lift",
                "type": "Lift",
                "location": "Block A",
                "status": "Inactive"
              });}, label: Icon(Icons.remove_red_eye_outlined, color: Colors.blue,size: 14.sp,))

            ),
          );
        },
      ),
      floatingActionButton: 1==1? FloatingActionButton(
        backgroundColor: primaryColor,

        onPressed: () {
          Get.to(()=>AddMitigation());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ): null



    );
  }
}

