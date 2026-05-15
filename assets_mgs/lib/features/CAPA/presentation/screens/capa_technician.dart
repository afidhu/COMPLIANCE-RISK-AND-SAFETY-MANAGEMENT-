import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/asset_capa.dart';

class CapaTechnician extends StatefulWidget {
  const CapaTechnician({super.key});

  @override
  State<CapaTechnician> createState() => _CapaTechnicianState();
}

class _CapaTechnicianState extends State<CapaTechnician> {
  final Color primaryColor = const Color(0xFF0000BA);
  /// SAMPLE CAPA DATA
  final List<Map<String, dynamic>> capas = [

    {
      "capa_id": "CAPA-001",
      "risk_id": "RISK-001",
      "corrective_action":
      "Repair lift motor immediately",

      "preventive_action":
      "Conduct monthly lift maintenance",

      "deadline": "20/05/2026",
      "status": "Pending"
    },

    {
      "capa_id": "CAPA-002",
      "risk_id": "RISK-002",
      "corrective_action":
      "Replace exposed electrical cables",

      "preventive_action":
      "Weekly electrical inspections",

      "deadline": "25/05/2026",
      "status": "In Progress"
    },
    {
      "capa_id": "CAPA-002",
      "risk_id": "RISK-002",
      "corrective_action":
      "Replace exposed electrical cables",

      "preventive_action":
      "Weekly electrical inspections",

      "deadline": "25/05/2026",
      "status": "Completed"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,

        title: const Text(
          "Compliance Management",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,)),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active, color: Colors.white,fontWeight: FontWeight.bold,size: 30,)),
              TextButton(onPressed: (){},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10.r))
                  ),
                  child: Text('12',
                    style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
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

                              child: TextButton(onPressed: (){
                                setState(() {

                                });
                              },
                                  child: Text(
                                    item["status"],
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  )
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
                          height: 30.h,
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
          ),
        drawer: Drawer(),
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
