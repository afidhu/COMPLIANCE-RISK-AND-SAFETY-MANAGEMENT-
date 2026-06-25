import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:assets_mgs/features/CAPA/domain/entities/capa_entity.dart';
import 'package:assets_mgs/features/auths/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../notifications/presentation/bloc/notification_bloc.dart';
import '../../../notifications/presentation/screens/notifications.dart';
import '../../../notifications/presentation/widgets/notification_button.dart';
import '../bloc/capa_bloc.dart';
import '../widgets/asset_capa.dart';

class CapaTechnician extends StatefulWidget {
  const CapaTechnician({super.key});

  @override
  State<CapaTechnician> createState() => _CapaTechnicianState();
}

class _CapaTechnicianState extends State<CapaTechnician> {
  final Color primaryColor = const Color(0xFF0000BA);

  Color myColor(String staus) {
    switch (staus) {
      case 'PENDING':
        return Colors.orange;
      case 'COMPLETED':
        return Colors.green;
      case 'IN_PROGRESS':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTechnicianId();
  }

  void getTechnicianId ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   final userId = prefs.getString('userId');
    context.read<CapaBloc>().add(
      GetCapaByTechnicianEvent(userId.toString()),
    );

    context.read<NotificationBloc>().add(GetNotificationByUserEvent());
  }
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
          notificationButton()
        ],
      ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ()async{
            // context.read<CapaBloc>().add(
            //   GetCapaByTechnicianEvent(
            //       'cmq3r9t6n0000rte28j0zvojs'),
            // );
          },
          child: BlocBuilder<CapaBloc, CapaState>(
            builder: (context, state) {
              if (state is CapaLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CapaMessage) {
                return Center(child: Text(state.message.toString()));
              } else if (state is CapaLoaded) {
                if (state.capas.isEmpty) {
                  return Center(child: Text('NO Task assigned to you'));
                } else {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),

                    padding: const EdgeInsets.all(16),

                    itemCount: state.capas.length,

                    itemBuilder: (context, index) {
                      final item = state.capas[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// HEADER
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.assignment_turned_in,
                                      color: primaryColor,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.actionTitle ?? "CAPA Task",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 3),

                                        // Text(
                                        //   "CAPA ID : ${item.capaId}",
                                        //   style: TextStyle(
                                        //     color: Colors.grey.shade600,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),

                                  GestureDetector(
                                    onTapDown: (details) async {
                                      final selected = await showMenu<String>(
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                          details.globalPosition.dx,
                                          details.globalPosition.dy,
                                          0,
                                          0,
                                        ),
                                        items: const [
                                          PopupMenuItem(
                                            value: 'PENDING',
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.pending_actions,
                                                  color: Colors.orange,
                                                ),
                                                SizedBox(width: 10),
                                                Text('Pending'),
                                              ],
                                            ),
                                          ),

                                          PopupMenuItem(
                                            value: 'IN_PROGRESS',
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.build_circle,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(width: 10),
                                                Text('In Progress'),
                                              ],
                                            ),
                                          ),

                                          PopupMenuItem(
                                            value: 'COMPLETED',
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(width: 10),
                                                Text('Completed'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );

                                      if (selected != null)  {
                                       context.read<CapaBloc>().add(
                                          UpdateCapaByTechnicianEvent(
                                            capaId: item.capaId.toString(),
                                            capa: CapaEntity(status: selected.trim().toString()),
                                          ),
                                        );
                                     // return context.read<CapaBloc>().add(GetCapaByTechnicianEvent(item.assignedTo!.userId.toString()));
                                                                          }
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),

                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.blue),
                                      ),

                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              buildInfoRow(
                                Icons.build,
                                "Action Type",
                                item.actionType.toString(),

                              ),

                              buildInfoRow(
                                Icons.person,
                                "Technician",
                                item.assignedTo?.fullName ?? "N/A",
                              ),

                              buildInfoRow(
                                Icons.calendar_month,
                                "Deadline",
                                dateFormater( item.dueDate.toString().toString()),
                              ),
                              buildInfoRow(
                              Icons.pending_actions_outlined,
                              "Status: ${item.status}",
                              '',
                              ),

                              const Divider(height: 25),

                              const Text(
                                "Corrective Action",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,

                                ),
                              ),

                              const SizedBox(height: 8),

                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(14),

                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  // color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Text(item.actionTitle.toString(), style: TextStyle(color: Colors.red),),
                              ),

                              const SizedBox(height: 18),

                              SizedBox(
                                width: double.infinity,

                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),

                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),

                                  onPressed: () {
                                    assetCapa(asset: item.hazards!.asset);
                                  },

                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),

                                  label: const Text(
                                    "View Asset",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
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
        ),
      ),
      drawer: const DrawerWidget()
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryColor),

          const SizedBox(width: 10),

          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),

          Expanded(child: Text(value)),
        ],
      ),
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
