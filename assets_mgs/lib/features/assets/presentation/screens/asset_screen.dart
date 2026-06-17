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

      body: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          if(state is AssetsLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is AssetsMessage){
            return Text(state.infoMessage.toString());
          }
          else if(state is AssetsLoaded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              cacheExtent: 1000,
              padding: const EdgeInsets.all(16),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              itemCount: state.assets.length,
              itemBuilder: (context, index) {
                final asset =state. assets[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      /// ICON SECTION
                      RepaintBoundary(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: getAssetColor(asset.assetType.toString())
                                .withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            getAssetIcon(asset.assetType.toString()),
                            color: getAssetColor(asset.assetType.toString()),
                            size: 20,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// DETAILS SECTION
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// NAME
                            Text(
                              asset.assetName.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 6),

                            /// TYPE
                            Text(
                              "Type: ${asset.assetType.toString().toLowerCase()}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 3),

                            /// LOCATION
                            Text(
                              "Location: ${asset.location.toString()}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// ACTION BUTTON
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0000BA).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton.icon(
                          iconAlignment: IconAlignment.end,
                          onPressed: () {
                            assetCompliant(asset.compliance!.toList());
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: const Color(0xFF0000BA),
                            size: 14,
                          ),
                          label: const Text(
                            "View",
                            style: TextStyle(
                              color: Color(0xFF0000BA),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
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