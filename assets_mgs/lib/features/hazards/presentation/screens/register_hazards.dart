import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../assets/domain/entities/assets_entity.dart';
import '../../../assets/presentation/bloc/assets_bloc.dart';
import '../../domain/entities/hazards_entity.dart';
import '../bloc/hazards_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'hazards.dart';

class RegisterHazards extends StatefulWidget {
  const RegisterHazards({super.key});

  @override
  State<RegisterHazards> createState() => _RegisterHazardsState();
}

class _RegisterHazardsState extends State<RegisterHazards> {
  final _formKey = GlobalKey<FormState>();

  AssetsEntity? _selectedAsset;

  final TextEditingController complianceIdController = TextEditingController();

  final TextEditingController hazardTitleController = TextEditingController();

  final TextEditingController hazardDescriptionController =
      TextEditingController();

  final TextEditingController reportedByController = TextEditingController();

  String status = "OPEN";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AssetsBloc>().add(GetAssetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),

      appBar: AppBar(
        title: const Text("Register Hazard"),
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,

          child: Column(
            children: [
              /// HEADER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: const Color(0xFF0000BA),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Column(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 60,
                      color: Colors.white,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Hazard Registration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Report unsafe conditions before incidents occur",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              BlocBuilder<AssetsBloc, AssetsState>(
                builder: (context, state) {
                  if (state is AssetsLoaded) {
                    return DropdownSearch<AssetsEntity>(
                      items: (filter, _) => state.assets,

                      /// Display text
                      itemAsString: (AssetsEntity asset) =>
                          asset.assetName ?? "Unknown Asset",

                      /// Required for custom objects
                      compareFn: (AssetsEntity a, AssetsEntity b) =>
                          a.assetId == b.assetId,

                      selectedItem: _selectedAsset,

                      validator: (asset) => asset == null ? "Required" : null,

                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        fit: FlexFit.loose,

                        searchFieldProps: const TextFieldProps(
                          decoration: InputDecoration(
                            hintText: "Search asset...",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        emptyBuilder: (context, searchEntry) => const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child: Text("No assets found")),
                        ),
                      ),

                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          labelText: "Select Asset",
                          hintText: "Choose an asset",
                          prefixIcon: const Icon(Icons.inventory_2_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      onSelected: (AssetsEntity? asset) {
                        setState(() {
                          _selectedAsset = asset;
                        });
                        if (asset != null) {
                          debugPrint("Selected Asset ID: ${asset.assetId}");
                          debugPrint("Selected Asset: ${asset.assetName}");
                        }
                      },
                    );
                  }

                  if (state is AssetsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return const Center(child: Text("Failed to load assets"));
                },
              ),

              // const SizedBox(height: 15),
              //
              // buildTextField(
              //   controller: complianceIdController,
              //   label: "Compliance ID (Optional)",
              //   icon: Icons.verified_user,
              // ),
              const SizedBox(height: 15),

              buildTextField(
                controller: hazardTitleController,
                label: "Hazard Title",
                icon: Icons.warning,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: hazardDescriptionController,

                maxLines: 4,

                decoration: InputDecoration(
                  labelText: "Hazard Description",
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              // const SizedBox(height: 15),
              //
              // buildTextField(
              //   controller: reportedByController,
              //   label: "Reported By",
              //   icon: Icons.person,
              // ),
              //
              // const SizedBox(height: 15),
              //
              // DropdownButtonFormField<String>(
              //
              //   value: status,
              //
              //   decoration: InputDecoration(
              //     labelText: "Status",
              //     prefixIcon: const Icon(
              //       Icons.flag,
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius:
              //       BorderRadius.circular(14),
              //     ),
              //   ),
              //
              //   items: const [
              //
              //     DropdownMenuItem(
              //       value: "OPEN",
              //       child: Text("Open"),
              //     ),
              //
              //     DropdownMenuItem(
              //       value: "IN_PROGRESS",
              //       child: Text("In Progress"),
              //     ),
              //
              //     DropdownMenuItem(
              //       value: "CLOSED",
              //       child: Text("Closed"),
              //     ),
              //   ],
              //
              //   onChanged: (value) {
              //     setState(() {
              //       status = value!;
              //     });
              //   },
              // ),
              //
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0000BA),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () async {

                    if (_formKey.currentState!.validate()) {
                      final hazardsBloc = context.read<HazardsBloc>();
                      final scaffoldMessenger = ScaffoldMessenger.of(context);

                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final userId = prefs.getString('userId');
                      if (!mounted) return;

                      hazardsBloc.add(
                        AddHazardsEvent(
                          HazardsEntity(
                            assetId: _selectedAsset?.assetId ?? "",
                            reportedById: '$userId',
                            hazardTitle: hazardTitleController.text,
                            hazardDescription: hazardDescriptionController.text,
                            status: 'OPEN',
                          ),
                        ),
                      );
                      scaffoldMessenger.showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Hazard Registered"),
                        ),
                      );

                      complianceIdController.clear();
                      hazardTitleController.clear();
                      hazardDescriptionController.clear();

                      // Get.back();
                    }
                  },

                  icon: const Icon(Icons.save, color: Colors.white),

                  label: BlocConsumer<HazardsBloc, HazardsState>(
                    builder: (context, state) {
                      final isClicked =
                          state is IsHazardsAddedButtonClicked &&
                          state.isClicked;

                    return  isClicked
                          ?  CircularProgressIndicator()
                          : Text(
                              "Register Hazard",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                      return SizedBox.shrink();
                    },
                    listener: (context, state)async {
                      final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      final userType = prefs.getString('userType');
                      if(state is HazardsLoaded && state.isAdded){
                        if(state.isAdded ==true){
                          if(userType !='STAFF_MEMBER'){
                            Get.back();
                          }
                        }
                      }
                      return;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }

        return null;
      },

      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(icon),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  Widget _showAssets() {
    return BlocBuilder<AssetsBloc, AssetsState>(
      builder: (context, state) {
        if (state is AssetsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AssetsLoaded) {
          return ListView.builder(
            itemCount: state.assets.length,

            itemBuilder: (context, index) {
              final asset = state.assets[index];

              return ListTile(
                leading: const Icon(Icons.inventory_2),

                title: Text(asset.assetName.toString()),

                subtitle: Text(asset.assetType.toString()),

                onTap: () {
                  debugPrint(asset.assetName);
                  Get.back();
                },
              );
            },
          );
        }

        return const Center(child: Text("No Assets Found"));
      },
    );
  }
}
