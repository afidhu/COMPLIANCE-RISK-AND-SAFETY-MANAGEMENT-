import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/asset_capa.dart';
import 'add_capa.dart';
class AllCapa extends StatelessWidget {
  final List<Map<String, dynamic>> capas;
  const AllCapa({super.key, required this.capas});

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

        itemCount: capas.length,

        itemBuilder: (context, index) {

          final item = capas[index];

          return Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        "CAPA #${item["capa_id"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.orange
                              .withOpacity(0.1),

                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: Text(
                          item["status"],
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  buildTile(
                    title: "Corrective Action",
                    value:
                    item["corrective_action"],
                  ),
                  Divider(),

                  buildTile(
                    title: "Preventive Action",
                    value:
                    item["preventive_action"],
                  ),
                  Divider(),
                  SizedBox(
                    height: 36.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Technician:',textAlign: TextAlign.left,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text('  Engineer Juma'),
                      ],
                    ),
                  ),
                  Divider(),

                  buildTile(
                    title: "Deadline",
                    value: item["deadline"],
                  ),
                  
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(onPressed: (){assetCapa(asset:{
                      "id": 1,
                      "name": "Main Lift",
                      "type": "Lift",
                      "location": "Block A",
                      "status": "Inactive"
                    });}, label: Icon(Icons.remove_red_eye_outlined, color: Colors.blue,size: 14.sp,))
                  )
                  
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: 1 ==1? FloatingActionButton(
        backgroundColor: primaryColor,

        onPressed: () {
          Get.to(()=>AddCapa());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ):null,
    );

  }
  /// REUSABLE TILE
  Widget buildTile({
    required String title,
    required String value,
    Color color = Colors.black,
  }) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

