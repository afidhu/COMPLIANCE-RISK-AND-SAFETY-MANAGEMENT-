import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/presentation/bloc/assets_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AssetsReport extends StatefulWidget {
  const AssetsReport({super.key});

  @override
  State<AssetsReport> createState() => _AssetsReportState();
}

class _AssetsReportState extends State<AssetsReport> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AssetsBloc>().add(GetAssetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: themeSurfaceColor(context),


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
                    final state = context.read<AssetsBloc>().state;

                    if (state is AssetsLoaded) {
                      _exportToPdf(state.assets);
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
                    flex: 2,
                    child: Text(
                      "S/N",
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

              child: BlocBuilder<AssetsBloc, AssetsState>(
                  builder: (context, state) {
                    if (state is AssetsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AssetsMessage) {
                      return Text(state.infoMessage.toString());
                    } else if (state is AssetsLoaded) {
                      return ListView.builder(

                        itemCount: state.assets.length,

                        itemBuilder: (context, index) {
                          final asset = state.assets[index];

                          return Container(

                            margin:
                            const EdgeInsets.only(bottom: 12),

                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 16,
                            ),

                            decoration: BoxDecoration(

                              color: themeSurfaceColor(context),

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
                                    '${index+1}',
                                    style: const TextStyle(
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    asset.assetName.toString(),
                                  ),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    asset.location.toString(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
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

  Future<void> _exportToPdf(List<dynamic> assets) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),

        build: (context) => [

          pw.Center(
            child: pw.Text(
              "ASSETS REPORT",
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 8),

          pw.Center(
            child: pw.Text(
              "Facilities Management System",
              style: const pw.TextStyle(fontSize: 13),
            ),
          ),

          pw.SizedBox(height: 20),

          pw.Table.fromTextArray(
            border: pw.TableBorder.all(),

            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),

            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blue900,
            ),

            cellAlignment: pw.Alignment.centerLeft,

            headers: const [
              "S/N",
              "Asset Name",
              "Location",
            ],

            data: List.generate(
              assets.length,
                  (index) => [
                "${index + 1}",
                assets[index].assetName ?? "",
                assets[index].location ?? "",
              ],
            ),
          ),

          pw.SizedBox(height: 20),

          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text(
              "Generated on: ${DateTime.now()}",
              style: const pw.TextStyle(fontSize: 10),
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