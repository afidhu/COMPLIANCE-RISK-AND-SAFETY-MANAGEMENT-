import 'package:flutter/material.dart';

class AssetsReport extends StatefulWidget {
  const AssetsReport({super.key});

  @override
  State<AssetsReport> createState() => _AssetsReportState();
}

class _AssetsReportState extends State<AssetsReport> {

  /// SAMPLE ASSET DATA
  final List<Map<String, dynamic>> assets = [

    {
      "asset_id": "AST-001",
      "asset_name": "Passenger Lift",
      "location": "Main Lobby",
    },

    {
      "asset_id": "AST-002",
      "asset_name": "Fire Extinguisher",
      "location": "Floor 2",
    },

    {
      "asset_id": "AST-003",
      "asset_name": "Electrical Panel",
      "location": "Building A",
    },

    {
      "asset_id": "AST-004",
      "asset_name": "Boiler Machine",
      "location": "Mechanical Room",
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
                      "Assets Reports",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0000BA),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "All registered facility assets",
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
                    flex: 2,
                    child: Text(
                      "Asset ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Text(
                      "Asset Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
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

            /// ASSETS LIST
            Expanded(

              child: ListView.builder(

                itemCount: assets.length,

                itemBuilder: (context, index) {

                  final asset = assets[index];

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
                          flex: 2,
                          child: Text(
                            asset["asset_id"],
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 4,
                          child: Text(
                            asset["asset_name"],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Text(
                            asset["location"],
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