import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../config/themes/color_theme.dart';
import '../../../assets/domain/entities/assets_entity.dart';
import '../bloc/incident_bloc.dart';
import 'add_incident.dart';

class AllIncidents extends StatefulWidget {
  const AllIncidents({super.key});

  @override
  State<AllIncidents> createState() => _AllIncidentsState();
}

class _AllIncidentsState extends State<AllIncidents> {

  final Color primaryColor = const Color(0xFF0D47A1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IncidentBloc>().add(GetIncidentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: themeSurfaceColor(context),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primaryColor,
      //
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (_) => const AddIncident(),
      //       ),
      //     );
      //   },
      // ),

      body: BlocBuilder<IncidentBloc, IncidentState>(
        builder: (context, state) {
          if(state is IncidentLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is IncidentMessage){
            return Center(child: Text(state.message.toString()),);
          }
          else if (state is IncidentLoaded){
            if(state.incidents.isEmpty){
              return Center(child: Text('No Incident found'),);
            }
            else {
              return ListView.builder(

                padding: const EdgeInsets.all(14),

                itemCount:state.incidents.length,

                itemBuilder: (context, index) {
                  final incident = state.incidents[index];

                  return Container(

                    margin: const EdgeInsets.only(bottom: 14),

                    decoration: BoxDecoration(
                      color:themeSurfaceColor(context),

                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          /// TOP ROW
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                            children: [

                              Row(
                                children: [

                                  CircleAvatar(
                                    backgroundColor:
                                    primaryColor.withOpacity(0.1),

                                    child: Icon(
                                      Icons.warning_amber_rounded,
                                      color: primaryColor,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        incident.incidentTitle.toString(),
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 17,
                                          color: primaryColor,
                                        ),
                                      ),

                                      Text(
                                        "Asset: ${incident.asset!.assetName}",
                                        style: TextStyle(
                                          color:
                                          Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              buildStatusBadge(
                                  incident.severity!.toLowerCase().toString()),
                            ],
                          ),

                          const SizedBox(height: 16),

                          /// DESCRIPTION
                          Text(
                            incident.description.toString(),
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// DATE
                          Row(
                            children: [

                              Icon(
                                Icons.calendar_month,
                                size: 18,
                                color: Colors.grey.shade700,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                "Reported: ${incident.reportedBy!.role}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          /// ACTION BUTTONS
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.end,

                            children: [

                              TextButton.icon(
                                onPressed: () {
                                  incidentAsset(incident.asset);
                                },

                                icon: Icon(
                                  Icons.visibility,
                                  color: primaryColor,
                                ),

                                label: Text(
                                  "View",
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ),

                              TextButton.icon(
                                onPressed: () {},

                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),

                                label: const Text(
                                  "Edit",

                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
     return SizedBox.shrink();
        },
      ),
    );
  }

  /// STATUS BADGE
  Widget buildStatusBadge(String status) {
    Color badgeColor;

    switch (status) {
      case "Critical":
        badgeColor = Colors.red;
        break;

      case "High":
        badgeColor = Colors.orange;
        break;

      case "Medium":
        badgeColor = Colors.amber;
        break;

      default:
        badgeColor = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.15),

        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        status,
        style: TextStyle(
          color: badgeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void incidentAsset(AssetsEntity? asset) {
    if (asset == null) {
      Get.snackbar(
        "No Asset",
        "Asset information not found.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.bottomSheet(
      Container(
        height: Get.height * .78,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// Drag Handle
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 25),

              /// Icon
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xffEAF2FF),
                child: Icon(
                  Icons.apartment,
                  color: Colors.blue,
                  size: 40,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                asset.assetName ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                asset.assetType ?? "",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [

                    // ListTile(
                    //   leading: const CircleAvatar(
                    //     backgroundColor: Color(0xffEAF2FF),
                    //     child: Icon(Icons.tag, color: Colors.blue),
                    //   ),
                    //   title: const Text("Asset ID"),
                    //   subtitle: Text(asset.assetId ?? ""),
                    // ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffFFF4E5),
                        child: Icon(Icons.category, color: Colors.orange),
                      ),
                      title: const Text("Asset Type"),
                      subtitle: Text(asset.assetType ?? ""),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffE8F5E9),
                        child: Icon(Icons.location_on, color: Colors.green),
                      ),
                      title: const Text("Location"),
                      subtitle: Text(asset.location ?? ""),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffF3E5F5),
                        child: Icon(Icons.qr_code, color: Colors.purple),
                      ),
                      title: const Text("Serial Number"),
                      subtitle: Text(
                        asset.serialNo == null ||
                            asset.serialNo.toString().isEmpty
                            ? "Not Available"
                            : asset.serialNo.toString(),
                      ),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffE3F2FD),
                        child: Icon(Icons.check_circle, color: Colors.blue),
                      ),
                      title: const Text("Status"),
                      subtitle: Text(asset.status ?? ""),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                  label: const Text(
                    "Close",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}