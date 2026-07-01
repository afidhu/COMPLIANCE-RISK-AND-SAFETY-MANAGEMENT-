import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/capa_bloc.dart';

class CompletedApprovedCapa extends StatefulWidget {
  const CompletedApprovedCapa({super.key});

  @override
  State<CompletedApprovedCapa> createState() => _CompletedApprovedCapaState();
}

class _CompletedApprovedCapaState extends State<CompletedApprovedCapa> {
  Color getStatusColor(String status) {
    switch (status) {
      case "completed":
        return Colors.green;
      case "pending":
        return Colors.orange;
      case "overdue":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color getTypeColor(String type) {
    switch (type) {
      case "CORRECTIVE":
        return Colors.blue;
      case "PREVENTIVE":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData getTypeIcon(String type) {
    switch (type) {
      case "corrective":
        return Icons.build_circle;
      case "preventive":
        return Icons.security;
      default:
        return Icons.task_alt;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CapaBloc>().add(GetCompletedApprovedCapaByTechnicianEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeSurfaceColor(context),

      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text("Completed Tasks"),
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: BlocBuilder<CapaBloc, CapaState>(
        builder: (context, state) {
          if(state is CapaLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is CapaMessage){
            return Center(child: Text(state.message.toString()),);
          }
          else if(state is CapaLoaded){
            if(state.capas.isEmpty){
              return Center(child: Text('No approved completed Task'),);
            }
            else {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.capas.length,
                itemBuilder: (context, index) {
                  final capa = state.capas[index];

                  // final hazard = capa["hazard"];
                  // final asset = hazard["asset"];
                  // final assigned = capa["assignedTo"];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: themeSurfaceColor(context),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// TOP ROW
                        Row(
                          children: [

                            CircleAvatar(
                              backgroundColor:
                              getTypeColor(capa.actionType.toString().toString()).withOpacity(0.15),
                              child: Icon(
                                getTypeIcon(capa.actionType.toString().toLowerCase()),
                                color: getTypeColor(capa.actionType.toString().toLowerCase()),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    capa.actionTitle!.toLowerCase(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  // Text(
                                  //   "CAPA ID: ${capa["capaId"]}",
                                  //   style: const TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: getStatusColor(capa.status.toString().toLowerCase())
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                              capa.status.toString().toLowerCase(),
                                style: TextStyle(
                                  color: getStatusColor(capa.status.toString().toLowerCase()),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        /// ASSET INFO
                        Row(
                          children: [
                            const Icon(Icons.apartment,
                                size: 18, color: Colors.blue),
                            const SizedBox(width: 6),
                            Text(
                              capa.hazards!.asset!.assetName.toString(),
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "(${capa.hazards!.asset!.location})",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        /// HAZARD INFO
                        Row(
                          children: [
                            const Icon(Icons.warning_amber,
                                size: 18, color: Colors.orange),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                            capa.hazards!.hazardTitle.toString(),
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        /// ASSIGNED TO
                        Row(
                          children: [
                            const Icon(Icons.person,
                                size: 18, color: Colors.indigo),
                            const SizedBox(width: 6),
                            Text(
                              capa.assignedTo!.fullName.toString(),
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        /// ACTION BUTTON
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () {
                              // PART 2 WILL OPEN FULL DETAILS BOTTOM SHEET
                            },
                            icon: const Icon(Icons.verified, color: Colors.green,),
                            label: const Text("Approved"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
         return SizedBox.shrink();
        },
      ),
      drawer: DrawerWidget(),
    );
  }
}