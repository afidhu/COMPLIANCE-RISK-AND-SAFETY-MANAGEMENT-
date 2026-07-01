import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../compliances/domain/entities/compliance_entity.dart';
import '../../../compliances/presentation/bloc/compliance_bloc.dart';
import '../../../compliances/presentation/screens/compliance_screen.dart';

class NotificationComplianceView extends StatefulWidget {

  const NotificationComplianceView({super.key,});


  @override
  State<NotificationComplianceView> createState() =>
      _NotificationComplianceViewState();
}

final ComplianceEntity? compliance = Get.arguments;

class _NotificationComplianceViewState
    extends State<NotificationComplianceView> {

  late TextEditingController _complianceName;
  late TextEditingController _assetName;
  late TextEditingController _location;
  late TextEditingController _lastDueDate;
  late TextEditingController _nextDueDate;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _complianceName = TextEditingController(
      text: compliance?.complianceName ?? "",
    );

    _assetName = TextEditingController(
      text: compliance?.asset?.assetName ?? "",
    );

    _location = TextEditingController(
      text: compliance?.asset?.location ?? "",
    );

    _lastDueDate = TextEditingController(
      text: dateFormater(compliance!.lastDueDate.toString()),
    );

    _nextDueDate = TextEditingController(
      text: dateFormater(compliance!.dueDate.toString() ),
    );
  }

  @override
  void dispose() {
    _complianceName.dispose();
    _assetName.dispose();
    _location.dispose();
    _lastDueDate.dispose();
    _nextDueDate.dispose();
    super.dispose();
  }

  Future<void> pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text =
      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day
          .toString().padLeft(2, '0')}";
    }
  }

  Widget input(String label,
      IconData icon,
      TextEditingController controller, {
        bool readOnly = false,
        VoidCallback? onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,

          prefixIcon: Icon(icon, color: Colors.indigo),
          filled: true,
          fillColor: readOnly ? Colors.grey.shade100 : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Future<void> updateCompliance() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Compliance updated successfully"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
             Get.back();
            },
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        title: const Text(
          "Compliance Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                input("Compliance Name", Icons.verified_user, _complianceName),

                input("Asset Name", Icons.business, _assetName,
                    readOnly: true),

                input("Location", Icons.location_on, _location,
                    readOnly: true),

                input(
                  "Last Due Date",
                  Icons.history,
                  _lastDueDate,
                  onTap: () => pickDate(_lastDueDate),
                ),

                input(
                  "Next Due Date",
                  Icons.event,
                  _nextDueDate,
                  onTap: () => pickDate(_nextDueDate),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0000BA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    // onPressed: isLoading ? null : updateCompliance,
                    // icon: isLoading
                    //     ? const SizedBox(
                    //   width: 20,
                    //   height: 20,
                    //   child: CircularProgressIndicator(
                    //     color: Colors.white,
                    //     strokeWidth: 2,
                    //   ),
                    // )
                    //     : const Icon(Icons.save),
                    onPressed: () {
                      final addCompliance = context.read<ComplianceBloc>();
                      addCompliance.add(UpdateComplianceEvent(
                          ComplianceEntity(
                            complianceName: _complianceName.text,
                            lastDueDate: _lastDueDate.text,
                            dueDate: _nextDueDate.text,
                            frequency: compliance!.frequency,
                          )
                          , compliance!.complianceId.toString()
                      ),
                      );
                    },
                    label: BlocConsumer<ComplianceBloc, ComplianceState>(
                      listener: (context, state) {
                        final bool isUpdated = state is ComplianceUpdated && state.isUpdated;

                        if(isUpdated){
                          Get.snackbar('Successful', 'Compliance Updated',
                            colorText: Colors.white,
                           forwardAnimationCurve: Curves.bounceInOut,
                            duration: Duration(seconds: 2),
                            backgroundColor: Color(0xFF0000BA),
                            backgroundGradient: LinearGradient(colors: [
                              Color(0xFF0000BA),
                              Colors.green,
                              Colors.redAccent
                            ])
                          );
                          // Get.back();
                        }
                      },
                      builder: (context, state) {
                        final bool isUpdated = state is ComplianceUpdated && state.isUpdated;
                        return  Text(isUpdated ? 'Updated': " Update Compliance",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}