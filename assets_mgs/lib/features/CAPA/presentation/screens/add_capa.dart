import 'package:flutter/material.dart';

class AddCapa extends StatefulWidget {
  const AddCapa({super.key});

  @override
  State<AddCapa> createState() => _AddCapaState();
}

class _AddCapaState extends State<AddCapa> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController riskIdController =
  TextEditingController();

  final TextEditingController correctiveController =
  TextEditingController();

  final TextEditingController preventiveController =
  TextEditingController();

  final TextEditingController deadlineController =
  TextEditingController();

  String selectedStatus = "Pending";

  final Color primaryColor = const Color(0xFF0000BA);

  Future<void> selectDate() async {

    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {

      setState(() {

        deadlineController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
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
        title: const Text("Add CAPA"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "Corrective & Preventive Action",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// RISK ID
                  buildTextField(
                    controller: riskIdController,
                    label: "Risk ID",
                    hint: "Enter risk ID",
                    icon: Icons.warning,
                  ),

                  const SizedBox(height: 18),

                  /// CORRECTIVE ACTION
                  buildTextField(
                    controller: correctiveController,
                    label: "Corrective Action",
                    hint:
                    "e.g Repair faulty lift motor",
                    icon: Icons.build,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 18),

                  /// PREVENTIVE ACTION
                  buildTextField(
                    controller: preventiveController,
                    label: "Preventive Action",
                    hint:
                    "e.g Schedule monthly maintenance",
                    icon: Icons.shield,
                    maxLines: 3,
                  ),
                  buildTextField(
                    controller: preventiveController,
                    label: "Technician",
                    hint:
                    "e.g Engineer juma",
                    icon: Icons.build,
                    maxLines: 1,
                  ),

                  const SizedBox(height: 18),

                  /// DEADLINE
                  Text(
                    "Deadline",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: deadlineController,
                    readOnly: true,
                    onTap: selectDate,

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return "Select deadline";
                      }
                      return null;
                    },

                    decoration: InputDecoration(

                      hintText: "Select deadline",

                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      ),

                      suffixIcon: IconButton(
                        onPressed: selectDate,

                        icon: Icon(
                          Icons.date_range,
                          color: primaryColor,
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// STATUS
                  Text(
                    "Status",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(

                    value: selectedStatus,

                    items: [
                      "Pending",
                      "In Progress",
                      "Completed"
                    ]
                        .map(
                          (status) =>
                          DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ),
                    )
                        .toList(),

                    onChanged: (value) {

                      setState(() {
                        selectedStatus = value!;
                      });
                    },

                    decoration: InputDecoration(

                      prefixIcon: Icon(
                        Icons.flag,
                        color: primaryColor,
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),
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
                        backgroundColor:
                        primaryColor,

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
                              content: Text(
                                "CAPA Added Successfully",
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
                        "Save CAPA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight:
                          FontWeight.bold,
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
      crossAxisAlignment:
      CrossAxisAlignment.start,

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

            if (value == null ||
                value.isEmpty) {

              return "Required field";
            }

            return null;
          },

          decoration: InputDecoration(

            hintText: hint,

            prefixIcon: Icon(
              icon,
              color: primaryColor,
            ),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}