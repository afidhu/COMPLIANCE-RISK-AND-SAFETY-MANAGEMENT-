import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:popup_menu/popup_menu.dart';

import '../../../notifications/presentation/screens/notifications.dart';
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
      "corrective_action": "Repair lift motor immediately",

      "preventive_action": "Conduct monthly lift maintenance",

      "deadline": "20/05/2026",
      "status": "Pending",
    },

    {
      "capa_id": "CAPA-002",
      "risk_id": "RISK-002",
      "corrective_action": "Replace exposed electrical cables",

      "preventive_action": "Weekly electrical inspections",

      "deadline": "25/05/2026",
      "status": "In Progress",
    },
    {
      "capa_id": "CAPA-002",
      "risk_id": "RISK-002",
      "corrective_action": "Replace exposed electrical cables",

      "preventive_action": "Weekly electrical inspections",

      "deadline": "25/05/2026",
      "status": "Completed",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        backgroundColor: const Color(0xFF0000BA),

        centerTitle: true,

        surfaceTintColor: Colors.transparent,

        foregroundColor: Colors.white,
        title: const Text(
          "Facilities Management",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),



        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              clipBehavior: Clip.none,
              children: [

                // Notification Icon
                IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                // Notification Badge
                Positioned(
                  right: 2,
                  top: 2,

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: GestureDetector(
                      onTap: (){
                        debugPrint("12");
                        Get.to(()=>Notifications());
                      },
                      child: const Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],



      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount: capas.length,

          itemBuilder: (context, index) {
            final item = capas[index];

          Color myColor(){
              switch (item['status']) {
                case 'Pending':
                  return Colors.orange;
                  break;
                case 'Completed':
                  return Colors.green;
                case 'In Progress':
                  return Colors.blue;
                  default:
                    return Colors.white;
              }
            }

            return Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: GestureDetector(
                            onTapDown: (TapDownDetails details) async {

                              final selected = await showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                  0,
                                  0,
                                ),
                                items: [
                                  PopupMenuItem(
                                    // labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.yellow)),
                                    value: 'pending',
                                    child: Text('Pending'),
                                  ),
                                  PopupMenuItem(
                                    value: 'progress',
                                    child: Text('In Progress'),
                                  ),
                                  PopupMenuItem(
                                    value: 'completed',
                                    child: Text('completed'),
                                  ),
                                ],
                              );

                              print(selected);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:myColor(),
                                borderRadius: BorderRadius.circular(20.r)

                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                item['status'],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    buildTile(
                      title: "Corrective Action",
                      value: item["corrective_action"],
                    ),
                    Divider(),

                    buildTile(
                      title: "Preventive Action",
                      value: item["preventive_action"],
                    ),
                    Divider(),
                    SizedBox(
                      // height: 45.h,
                      child: Flexible(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Technician:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('  Engineer Juma'),
                          ],
                        ),
                      ),
                    ),
                    Divider(),

                    buildTile(title: "Deadline", value: item["deadline"]),

                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton.icon(
                        onPressed: () {
                          assetCapa(
                            asset: {
                              "id": 1,
                              "name": "Main Lift",
                              "type": "Lift",
                              "location": "Block A",
                              "status": "Inactive",
                            },
                          );
                        },
                        label: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.blue,
                          size: 25.sp,
                        ),
                      ),
                    ),
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
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
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
