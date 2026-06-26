import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../risks/presentation/bloc/risks_bloc.dart';

class RiskReports extends StatefulWidget {
  const RiskReports({super.key});

  @override
  State<RiskReports> createState() => _RiskReportsState();
}

class _RiskReportsState extends State<RiskReports> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RisksBloc>().add(GetRiskAllEvent());
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
                    final state = context.read<RisksBloc>().state;

                    if (state is RisksLoaded) {
                      exportRiskReport(state.risks);
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

              child: BlocBuilder<RisksBloc, RisksState>(
                  builder: (context, state) {
                    if (state is RisksLoading) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if (state is RisksMessage) {
                      return Center(child: Text(state.message.toString()),);
                    }
                    else if (state is RisksLoaded) {
                      if (state.risks.isEmpty) {
                        return Center(child: Text('No Risks'),);
                      }
                      else {
                        return ListView.builder(

                          itemCount: state.risks.length,

                          itemBuilder: (context, index) {
                            final risk = state.risks[index];

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
                                      "${index+1}",
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      risk.riskTitle.toString(),
                                      style: const TextStyle(
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      risk.hazard!.asset!.assetName.toString(),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      risk.hazard!.asset!.location.toString(),
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
  Future<void> exportRiskReport(List<dynamic> risks) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),

        build: (context) => [

          pw.Text(
            "Facilities Risk Report",
            style: pw.TextStyle(
              fontSize: 22,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 8),

          pw.Text(
            "Generated on: ${DateTime.now()}",
            style: const pw.TextStyle(fontSize: 12),
          ),

          pw.SizedBox(height: 20),

          pw.Table.fromTextArray(
            border: pw.TableBorder.all(),

            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blue900,
            ),

            headerStyle: pw.TextStyle(
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
            ),

            cellAlignment: pw.Alignment.centerLeft,

            headers: const [
              "No",
              "Risk",
              "Asset",
              "Location",
            ],

            data: List.generate(
              risks.length,
                  (index) => [

                "${index + 1}",

                risks[index].riskTitle ?? "",

                risks[index].hazard?.asset?.assetName ?? "",

                risks[index].hazard?.asset?.location ?? "",
              ],
            ),
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}