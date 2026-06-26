import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../Incidents/presentation/bloc/incident_bloc.dart';

class IncidentReport extends StatefulWidget {
  const IncidentReport({super.key});

  @override
  State<IncidentReport> createState() => _IncidentReportState();
}

class _IncidentReportState extends State<IncidentReport> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IncidentBloc>().add(GetIncidentEvent());
  }


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
                    backgroundColor: const Color(0xFF0000BA),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    final state = context.read<IncidentBloc>().state;

                    if (state is IncidentLoaded) {
                      exportIncidentPdf(state.incidents);
                    }
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text("Export PDF"),
                )
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

              child:  BlocBuilder<IncidentBloc, IncidentState>(
                  builder: (context, state) {
                    if(state is IncidentLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if(state is IncidentMessage){
                      return Center(child: Text(state.message.toString()),);
                    }
                    else if (state is IncidentLoaded) {
                      if (state.incidents.isEmpty) {
                        return Center(child: Text('No Incident found'),);
                      }
                      else {
                        return ListView.builder(

                          itemCount: state.incidents.length,

                          itemBuilder: (context, index) {
                            final incident = state.incidents[index];

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
                                      incident.incidentTitle.toString(),
                                      style: const TextStyle(
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      incident.asset!.assetName.toString(),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      incident.asset!.location.toString(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                        dateFormater(incident.createdAt.toString())
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }
                    return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> exportIncidentPdf(List incidents) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [

          pw.Text(
            "Incident Report",
            style: pw.TextStyle(
              fontSize: 22,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 20),

          pw.Table.fromTextArray(
            border: pw.TableBorder.all(),

            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),

            headers: const [
              "Incident",
              "Asset",
              "Location",
              "Reported",
            ],

            data: incidents.map<List<String>>((incident) {
              return [
                incident.incidentTitle.toString(),
                incident.asset?.assetName.toString() ?? "",
                incident.asset?.location.toString() ?? "",
                dateFormater(
                  incident.createdAt.toString(),
                ),
              ];
            }).toList(),
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

}