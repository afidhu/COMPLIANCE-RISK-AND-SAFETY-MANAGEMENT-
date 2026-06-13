import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CAPA/presentation/widgets/asset_capa.dart';
import '../bloc/mitigation_bloc.dart';
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

      body: BlocBuilder<MitigationBloc, MitigationState>(
  builder: (context, state) {
    if(state is MitigationLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    else if (state is MitigationMessage){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is MitigationLoaded){
      if(state.mitigation.isEmpty){
        return Center(child: Text('No mitigation per Hazard'),);
      }
      else {
        return ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount:state.mitigation.length,

          itemBuilder: (context, index) {

            final item =state.mitigation[index];

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
                    item.actionTitle.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    "Created: ${item.createdAt.toString()}",
                  ),
                  trailing:TextButton.icon(
                      onPressed: (){
                    assetCapa(asset:item.hazards!.asset)
                    ;}, label: Icon(Icons.remove_red_eye_outlined, color: Colors.blue,size: 20.sp,))

              ),
            );
          },
        );
      }
    }
return SizedBox.shrink();
  },
),
      floatingActionButton: 1==1? FloatingActionButton(
        backgroundColor: primaryColor,

        onPressed: () {
          // Get.to(()=>AddMitigation());
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ): null



    );
  }
}

