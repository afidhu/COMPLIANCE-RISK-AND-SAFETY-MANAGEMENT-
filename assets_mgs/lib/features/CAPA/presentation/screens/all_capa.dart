import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bloc/capa_bloc.dart';
import '../widgets/asset_capa.dart';
import 'add_capa.dart';
class AllCapa extends StatelessWidget {
  final List<Map<String, dynamic>> capas;
  const AllCapa({super.key, required this.capas});

  final Color primaryColor = const Color(0xFF0000BA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<CapaBloc, CapaState>(
  builder: (context, state) {
    if(state is CapaLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    else if ( state is CapaMessage){
      return Center(child: Text(state.message.toString()),);
    }
    else if (state is CapaLoaded){
      if (state.capas.isEmpty){
        return Center(child: Text('No capa Per hazard'),);
      }
      else {
        return ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount:state.capas.length,

          itemBuilder: (context, index) {

            final item =state.capas[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TOP ROW (STATUS + MENU STYLE CHIP)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// STATUS CHIP
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          item.status.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                          ),
                        ),
                      ),

                      /// OPTIONAL ICON (instead of empty space)
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  /// ACTION TITLE (MAIN FOCUS)
                  Text(
                    item.actionTitle.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  /// ACTION TYPE (SUB INFO)
                  Text(
                    item.actionType.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Divider(color: Colors.grey.shade200),

                  const SizedBox(height: 10),

                  /// TECHNICIAN
                  _infoRow(
                    icon: Icons.person_outline,
                    label: "Technician",
                    value: item.assignedTo?.fullName.toString() ?? "-",
                  ),

                  const SizedBox(height: 10),

                  /// DEADLINE
                  _infoRow(
                    icon: Icons.calendar_month_outlined,
                    label: "Deadline",
                    value: dateFormater(item.dueDate.toString()),
                  ),

                  const SizedBox(height: 14),

                  /// ACTION BUTTON
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        assetCapa(asset: item.hazards!.asset);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0000BA),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.visibility_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "View Asset",
                        style: TextStyle(fontSize: 13),
                      ),
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
  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

