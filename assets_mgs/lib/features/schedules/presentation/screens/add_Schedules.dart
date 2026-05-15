import 'package:flutter/material.dart';

class AddSchedules extends StatefulWidget {
  const AddSchedules({super.key});

  @override
  State<AddSchedules> createState() => _AddSchedulesState();
}

class _AddSchedulesState extends State<AddSchedules> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController assetIdController =
  TextEditingController();

  final TextEditingController conductDateController =
  TextEditingController();

  String selectedStatus = "Pending";

  final List<String> statuses = [
    "Pending",
    "Completed",
  ];

  Future<void> pickDate() async {

    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {

      setState(() {

        conductDateController.text =
        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,

        title: const Text(
          "Add Schedule",
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
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// Asset ID
              const Text(
                "Asset ID",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: assetIdController,

                decoration: InputDecoration(
                  hintText: "Enter Asset ID",

                  prefixIcon: const Icon(
                    Icons.inventory_2,
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Asset ID is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// Conduct Date
              const Text(
                "Conduct Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: conductDateController,
                readOnly: true,

                onTap: pickDate,

                decoration: InputDecoration(
                  hintText: "Select Conduct Date",

                  prefixIcon: const Icon(
                    Icons.calendar_month,
                  ),

                  suffixIcon: IconButton(
                    onPressed: pickDate,
                    icon: const Icon(Icons.date_range),
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Conduct Date is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// Status
              const Text(
                "Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(

                value: selectedStatus,

                items: statuses.map((status) {

                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );

                }).toList(),

                onChanged: (value) {

                  setState(() {
                    selectedStatus = value!;
                  });

                },

                decoration: InputDecoration(

                  prefixIcon: const Icon(
                    Icons.pending_actions,
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

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
                          content: Text(
                            "Schedule Added Successfully",
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text(
                    "SAVE SCHEDULE",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
}