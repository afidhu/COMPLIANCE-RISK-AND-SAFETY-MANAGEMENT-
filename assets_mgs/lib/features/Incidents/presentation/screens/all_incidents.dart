import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      backgroundColor: Colors.grey.shade100,

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddIncident(),
            ),
          );
        },
      ),

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
                      color: Colors.white,

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
                                  incident.status.toString()),
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
                                "Reported: ${incident.reportedById}",
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
                                onPressed: () {},

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
}