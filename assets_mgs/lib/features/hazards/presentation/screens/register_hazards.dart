import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../assets/presentation/bloc/assets_bloc.dart';
import '../../domain/entities/hazards_entity.dart';
import '../bloc/hazards_bloc.dart';

class RegisterHazards extends StatefulWidget {
  const RegisterHazards({super.key});

  @override
  State<RegisterHazards> createState() => _RegisterHazardsState();
}

class _RegisterHazardsState extends State<RegisterHazards> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController assetIdController =
  TextEditingController();

  final TextEditingController complianceIdController =
  TextEditingController();

  final TextEditingController hazardTitleController =
  TextEditingController();

  final TextEditingController hazardDescriptionController =
  TextEditingController();

  final TextEditingController reportedByController =
  TextEditingController();

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
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              BlocBuilder<AssetsBloc, AssetsState>(
                builder: (context, state) {

                  if (state is AssetsLoaded) {

                    return DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Select Asset",
                        border: OutlineInputBorder(),
                      ),

                      items: state.assets.map((asset) {

                        return DropdownMenuItem(

                          value: asset.assetId,

                          child: Text(
                            asset.assetName.toString(),
                          ),
                        );

                      }).toList(),

                      onChanged: (value) {
                        assetIdController.text =value!;
                        print(value);
                      },
                    );

                  }

                  return const CircularProgressIndicator();
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
                  prefixIcon: const Icon(
                    Icons.description,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: reportedByController,
                label: "Reported By",
                icon: Icons.person,
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(

                value: status,

                decoration: InputDecoration(
                  labelText: "Status",
                  prefixIcon: const Icon(
                    Icons.flag,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),

                items: const [

                  DropdownMenuItem(
                    value: "OPEN",
                    child: Text("Open"),
                  ),

                  DropdownMenuItem(
                    value: "IN_PROGRESS",
                    child: Text("In Progress"),
                  ),

                  DropdownMenuItem(
                    value: "CLOSED",
                    child: Text("Closed"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    status = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF0000BA),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () {
                    if (_formKey.currentState!
                        .validate()) {
                      context.read<HazardsBloc>().add(AddHazardsEvent(
                          HazardsEntity(
                              assetId: assetIdController.text,
                              reportedById: "cmqc4upxw0006n8e2yker51u9",
                              hazardTitle: hazardTitleController.text,
                              hazardDescription: hazardDescriptionController.text,
                              status: status
                          )
                      ));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content:
                          Text("Hazard Registered"),
                        ),
                      );

                      // Get.back();
                    }
                  },

                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Register Hazard",
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
      ),
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

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget _showAssets() {
    return BlocBuilder<AssetsBloc, AssetsState>(
      builder: (context, state) {

        if (state is AssetsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AssetsLoaded) {

          return ListView.builder(
            itemCount: state.assets.length,

            itemBuilder: (context, index) {

              final asset = state.assets[index];

              return ListTile(
                leading: const Icon(Icons.inventory_2),

                title: Text(
                  asset.assetName.toString(),
                ),

                subtitle: Text(
                  asset.assetType.toString(),
                ),

                onTap: () {

                  print(asset.assetName);

                  Get.back();
                },
              );
            },
          );
        }

        return const Center(
          child: Text("No Assets Found"),
        );
      },
    );
  }

}