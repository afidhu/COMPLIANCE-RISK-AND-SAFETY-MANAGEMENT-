import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:flutter/material.dart';

class AddIncident extends StatefulWidget {
  const AddIncident({super.key});

  @override
  State<AddIncident> createState() => _AddIncidentState();
}

class _AddIncidentState extends State<AddIncident> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController assetIdController =
  TextEditingController();

  final TextEditingController incidentTypeController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  final TextEditingController dateController =
  TextEditingController();

  final Color primaryColor = const Color(0xFF0D47A1);

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: themeSurfaceColor(context),

      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add Incident",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
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
                      "Incident Information",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Asset ID
                    buildTextField(
                      controller: assetIdController,
                      label: "Asset ID",
                      hint: "Enter asset ID",
                      icon: Icons.precision_manufacturing,
                    ),

                    const SizedBox(height: 18),

                    /// Incident Type
                    buildTextField(
                      controller: incidentTypeController,
                      label: "Incident Type",
                      hint: "e.g Fire Outbreak",
                      icon: Icons.warning_amber_rounded,
                    ),

                    const SizedBox(height: 18),

                    /// Description
                    buildTextField(
                      controller: descriptionController,
                      label: "Description",
                      hint: "Enter incident description",
                      icon: Icons.description,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 18),

                    /// Date Reported
                    Text(
                      "Date Reported",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: selectDate,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Select date";
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        hintText: "Select date",

                        filled: true,
                        fillColor: Colors.white,

                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: primaryColor,
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.date_range,
                            color: primaryColor,
                          ),
                          onPressed: selectDate,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// SAVE BUTTON
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
                                content: Text(
                                  "Incident Added Successfully",
                                ),
                              ),
                            );
                          }
                        },

                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "Save Incident",
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

  /// REUSABLE TEXTFIELD
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
            color: primaryColor,
            fontWeight: FontWeight.w600,
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