import 'package:flutter/material.dart';

class AddCompliance extends StatefulWidget {
  const AddCompliance({super.key});

  @override
  State<AddCompliance> createState() => _AddComplianceState();
}

class _AddComplianceState extends State<AddCompliance> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController assetIdController = TextEditingController();
  final TextEditingController complianceNameController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController lastDueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  String status = "Pending";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF4F7FC),

      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Add Compliance",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              _buildField(
                controller: assetIdController,
                label: "Asset ID",
                icon: Icons.inventory_2,
              ),

              const SizedBox(height: 12),

              _buildField(
                controller: complianceNameController,
                label: "Compliance Name",
                icon: Icons.verified,
              ),

              const SizedBox(height: 12),

              _buildField(
                controller: frequencyController,
                label: "Frequency (Monthly / Yearly)",
                icon: Icons.repeat,
              ),

              const SizedBox(height: 12),

              _buildField(
                controller: lastDueController,
                label: "Last Due Date (YYYY-MM-DD)",
                icon: Icons.history,
              ),

              const SizedBox(height: 12),

              _buildDateField(
                controller: dueDateController,
                label: "Due Date (YYYY-MM-DD)",
                icon: Icons.calendar_month,
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(

                value: status,

                decoration: InputDecoration(
                  labelText: "Status",
                  prefixIcon: const Icon(Icons.flag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                items: const [

                  DropdownMenuItem(
                    value: "Compliant",
                    child: Text("Compliant"),
                  ),

                  DropdownMenuItem(
                    value: "Pending",
                    child: Text("Pending"),
                  ),

                  DropdownMenuItem(
                    value: "Overdue",
                    child: Text("Overdue"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    status = value!;
                  });
                },
              ),

              const SizedBox(height: 25),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Compliance Added"),
                        ),
                      );
                    }
                  },

                  icon: const Icon(Icons.save, color: Colors.white),

                  label: const Text(
                    "Save Compliance",
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

  Widget _buildField({
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
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(

      controller: controller,
      readOnly: true, // important (disable typing)

      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),

      onTap: () async {

        DateTime? pickedDate = await showDatePicker(

          context: context,

          initialDate: DateTime.now(),

          firstDate: DateTime(2020),

          lastDate: DateTime(2100),

        );

        if (pickedDate != null) {

          String formattedDate =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";

          setState(() {
            controller.text = formattedDate;
          });
        }
      },
    );
  }
}