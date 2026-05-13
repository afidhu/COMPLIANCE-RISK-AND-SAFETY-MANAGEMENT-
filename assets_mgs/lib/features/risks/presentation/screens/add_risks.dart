import 'package:flutter/material.dart';

class AddRisks extends StatefulWidget {
  const AddRisks({super.key});

  @override
  State<AddRisks> createState() => _AddRisksState();
}

class _AddRisksState extends State<AddRisks> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController assetIdController = TextEditingController();
  final TextEditingController riskNameController = TextEditingController();
  final TextEditingController mitigationController = TextEditingController();

  String selectedRiskLevel = "High";

  final Color primaryColor = const Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          "Add Risk",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Title
                    Text(
                      "Risk Information",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Asset ID
                    buildTextField(
                      controller: assetIdController,
                      label: "Asset ID",
                      hint: "Enter asset ID",
                      icon: Icons.precision_manufacturing,
                    ),

                    const SizedBox(height: 16),

                    /// Risk Name
                    buildTextField(
                      controller: riskNameController,
                      label: "Risk Name",
                      hint: "e.g. Lift Fault",
                      icon: Icons.warning_amber_rounded,
                    ),

                    const SizedBox(height: 16),

                    /// Risk Level
                    Text(
                      "Risk Level",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedRiskLevel,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.security,
                          color: primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: ["Low", "Medium", "High"]
                          .map(
                            (level) => DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRiskLevel = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    /// Mitigation Action
                    buildTextField(
                      controller: mitigationController,
                      label: "Mitigation Action",
                      hint: "e.g. Close lift immediately",
                      icon: Icons.build_circle,
                      maxLines: 3,
                    ),

                    const SizedBox(height: 30),

                    /// Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Risk Added Successfully"),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Save Risk",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable TextField
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Required field";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              icon,
              color: primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}