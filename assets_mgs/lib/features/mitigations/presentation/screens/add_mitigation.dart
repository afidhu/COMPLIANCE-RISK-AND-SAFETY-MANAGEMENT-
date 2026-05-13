import 'package:flutter/material.dart';

class AddMitigation extends StatefulWidget {
  const AddMitigation({super.key});

  @override
  State<AddMitigation> createState() => _AddMitigationState();
}

class _AddMitigationState extends State<AddMitigation> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController riskIdController = TextEditingController();
  final TextEditingController mitigationNameController = TextEditingController();
  final TextEditingController createdDateController = TextEditingController();

  final Color primaryColor = const Color(0xFF0000BA);

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        createdDateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text("Add Mitigation"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    "Mitigation Action Form",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// RISK ID
                  _buildField(
                    controller: riskIdController,
                    label: "Risk ID",
                    hint: "e.g RISK-001",
                    icon: Icons.warning_amber,
                  ),

                  const SizedBox(height: 18),

                  /// MITIGATION NAME
                  _buildField(
                    controller: mitigationNameController,
                    label: "Mitigation Action",
                    hint: "e.g Close lift immediately / Fix wiring",
                    icon: Icons.shield,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 18),

                  /// DATE
                  Text(
                    "Created Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: createdDateController,
                    readOnly: true,
                    onTap: pickDate,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select date";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      hintText: "Select date",

                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      ),

                      suffixIcon: IconButton(
                        onPressed: pickDate,
                        icon: Icon(
                          Icons.date_range,
                          color: primaryColor,
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// BUTTON
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
                              content: Text("Mitigation saved successfully"),
                            ),
                          );
                        }
                      },

                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text(
                        "Save Mitigation",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
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
            prefixIcon: Icon(icon, color: primaryColor),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}