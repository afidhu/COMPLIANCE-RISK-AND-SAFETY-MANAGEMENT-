import 'package:flutter/material.dart';

class RiskReports extends StatefulWidget {
  const RiskReports({super.key});

  @override
  State<RiskReports> createState() => _RiskReportsState();
}

class _RiskReportsState extends State<RiskReports> {

  /// SAMPLE DATA
  final List<Map<String, dynamic>> risks = [

    {
      "risk_id": 1,
      "risk_name": "Exposed Electrical Wires",
      "asset_name": "Electrical Panel",
      "location": "Building A",
    },

    {
      "risk_id": 2,
      "risk_name": "Blocked Emergency Exit",
      "asset_name": "Fire Exit",
      "location": "Floor 2",
    },

    {
      "risk_id": 3,
      "risk_name": "Pressure Leakage",
      "asset_name": "Boiler Machine",
      "location": "Mechanical Room",
    },

    {
      "risk_id": 4,
      "risk_name": "Lift Door Fault",
      "asset_name": "Passenger Lift",
      "location": "Main Lobby",
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
                      "Risk Reports",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0000BA),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "All identified facility risks",
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

                  label: const Text(
                    "Export",
                  ),
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
                    flex: 1,
                    child: Text(
                      "ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Text(
                      "Risk",
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
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// DATA LIST
            Expanded(

              child: ListView.builder(

                itemCount: risks.length,

                itemBuilder: (context, index) {

                  final risk = risks[index];

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
                          flex: 1,
                          child: Text(
                            "${risk["risk_id"]}",
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Text(
                            risk["risk_name"],
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Text(
                            risk["asset_name"],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Text(
                            risk["location"],
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