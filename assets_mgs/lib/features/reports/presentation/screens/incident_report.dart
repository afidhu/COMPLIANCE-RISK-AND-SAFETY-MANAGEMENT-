import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';

class IncidentReport extends StatefulWidget {
  const IncidentReport({super.key});

  @override
  State<IncidentReport> createState() => _IncidentReportState();
}

class _IncidentReportState extends State<IncidentReport> {

  /// SAMPLE INCIDENT DATA
  final List<Map<String, dynamic>> incidents = [

    {
      "incident_name": "Fire Alarm Failure",
      "asset_name": "Fire System",
      "location": "Building A",
      "date_reported": "2026-05-15",
    },

    {
      "incident_name": "Lift Stuck",
      "asset_name": "Passenger Lift",
      "location": "Main Lobby",
      "date_reported": "2026-05-18",
    },

    {
      "incident_name": "Water Leakage",
      "asset_name": "Boiler Machine",
      "location": "Mechanical Room",
      "date_reported": "2026-05-20",
    },

    {
      "incident_name": "Electrical Shock",
      "asset_name": "Electrical Panel",
      "location": "Floor 2",
      "date_reported": "2026-05-22",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            /// HEADER
            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Incident Reports",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0000BA),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "All reported incidents",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                /// EXPORT BUTTON
                ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    const Color(0xFF0000BA),

                    foregroundColor: Colors.white,

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () {

                    /// EXPORT LOGIC
                  },

                  icon: const Icon(Icons.download),

                  label: const Text("Export"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// TABLE HEADER
            Container(

              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),

              decoration: BoxDecoration(

                color: const Color(0xFF0000BA),

                borderRadius: BorderRadius.circular(14),
              ),

              child: const Row(

                children: [

                  Expanded(
                    flex: 3,
                    child: Text(
                      "Incident",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Text(
                      "Asset",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      "Reported",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// INCIDENT LIST
            Expanded(

              child: ListView.builder(

                itemCount: incidents.length,

                itemBuilder: (context, index) {

                  final incident = incidents[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(bottom: 12),

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(16),

                      boxShadow: [

                        BoxShadow(
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                          color: Colors.black
                              .withOpacity(0.04),
                        ),
                      ],
                    ),

                    child: Row(

                      children: [

                        Expanded(
                          flex: 3,
                          child: Text(
                            incident["incident_name"],
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Text(
                            incident["asset_name"],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Text(
                            incident["location"],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Text(
                            dateFormater(incident["date_reported"])
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}