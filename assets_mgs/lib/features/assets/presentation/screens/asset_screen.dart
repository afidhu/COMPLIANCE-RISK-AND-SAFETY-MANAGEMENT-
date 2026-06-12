import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/assets_bloc.dart';
import 'asset_compliant.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AssetsBloc>().add(GetAssetEvent());
  }
  //
  // // Sample Asset Data
  // final List<Map<String, dynamic>> assets = [
  //   {
  //     "id": 1,
  //     "name": "Main Fire Extinguisher",
  //     "type": "Fire Protection",
  //     "location": "Block A",
  //   },
  //   {
  //     "id": 2,
  //     "name": "Passenger Lift",
  //     "type": "Lift",
  //     "location": "Building B",
  //   },
  //   {
  //     "id": 3,
  //     "name": "Main Generator",
  //     "type": "Electrical",
  //     "location": "Power Room",
  //   },
  //   {
  //     "id": 4,
  //     "name": "Steam Boiler",
  //     "type": "Boiler",
  //     "location": "Factory Section",
  //   },
  // ];

  IconData getAssetIcon(String type) {
    switch (type) {
      case "Fire Protection":
        return Icons.local_fire_department;
      case "Lift":
        return Icons.elevator;
      case "Electrical":
        return Icons.electrical_services;
      case "Boiler":
        return Icons.precision_manufacturing;
      default:
        return Icons.business;
    }
  }

  Color getAssetColor(String type) {
    switch (type) {
      case "Fire Protection":
        return Colors.red;
      case "Lift":
        return Colors.blue;
      case "Electrical":
        return Colors.orange;
      case "Boiler":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF0000BA),
      //   foregroundColor: Colors.white,
      //   title: const Text("Assets"),
      //   elevation: 0,
      // ),

      body: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          if(state is AssetsLoading){
            return CircularProgressIndicator();
          }
          else if(state is AssetsMessage){
            return Text(state.infoMessage.toString());
          }
          else if(state is AssetsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.assets.length,
              itemBuilder: (context, index) {
                final asset =state. assets[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      // Asset Icon
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: getAssetColor(
                            asset.assetType.toString(),
                          ).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          getAssetIcon(asset.assetType.toString()),
                          color: getAssetColor(asset.assetType.toString()),
                          size: 20,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Asset Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              asset.assetName.toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Type: ${asset.assetType.toString()}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Location: ${asset.location.toString()}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0000BA).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton.icon(
                            onPressed: () {

                              assetCompliant(asset.compliance!.toList());
                            },
                            iconAlignment: IconAlignment.end,
                            label: const Text(
                              "Compliant",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 10.sp,
                            ),
                          )
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {
          // Add Asset
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}