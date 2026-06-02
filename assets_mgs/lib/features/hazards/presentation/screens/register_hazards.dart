import 'package:flutter/material.dart';

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

  String status = "Open";

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

              buildTextField(
                controller: assetIdController,
                label: "Asset ID",
                icon: Icons.inventory_2,
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: complianceIdController,
                label: "Compliance ID (Optional)",
                icon: Icons.verified_user,
              ),

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
                    value: "Open",
                    child: Text("Open"),
                  ),

                  DropdownMenuItem(
                    value: "In Progress",
                    child: Text("In Progress"),
                  ),

                  DropdownMenuItem(
                    value: "Closed",
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

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content:
                          Text("Hazard Registered"),
                        ),
                      );
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
}