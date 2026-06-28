import 'package:assets_mgs/features/Incidents/data/models/incident_model.dart';
import 'package:assets_mgs/features/assets/data/models/assets_model.dart';
import 'package:assets_mgs/features/risks/data/models/risks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Incidents/domain/entities/incident_entity.dart';
import '../../../assets/domain/entities/assets_entity.dart';
import '../../../risks/domain/entities/risk_entity.dart';
import '../../domain/entities/search_entity.dart';

class SearchedDetails {
  // STATIC ENTRY POINT: Replaces the Widget Build entirely
  static void open(SearchEntity search) {
    switch (search.type) {
      case "ASSET":
        _showAssetDetails(AssetsModel.fromJson(search.object));
        break;

      case "RISK":
        _showRiskDetails(RisksModel.fromJson(search.object));
        break;

      case "INCIDENT":
        _showIncidentDetails(IncidentModel.fromJson(search.object));
        break;

      default:
        Get.snackbar(
          "Error",
          "Unknown type: ${search.type}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }
  }

  // ==============================
  // ASSET DETAILS
  // ==============================
  static void _showAssetDetails(AssetsEntity asset) {
    Get.bottomSheet(
      isScrollControlled: true, // Allows Custom Heights
      Container(
        height: Get.height * 0.75,
        // FIX: backgroundColor is correctly assigned via decoration
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: _buildSheet(
          icon: Icons.apartment,
          color: Colors.blue,
          title: asset.assetName ?? "Asset",
          children: [
            _tile("Asset ID", asset.assetId ?? ""),
            _tile("Type", asset.assetType ?? ""),
            _tile("Location", asset.location ?? ""),
            _tile("Serial No", asset.serialNo.toString()),
            _tile("Status", asset.status ?? ""),
          ],
        ),
      ),
    );
  }

  // ==============================
  // INCIDENT DETAILS
  // ==============================
  static void _showIncidentDetails(IncidentEntity incident) {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: Get.height * 0.85,
        // FIX: backgroundColor is correctly assigned via decoration
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: _buildSheet(
          icon: Icons.warning_amber_rounded,
          color: Colors.red,
          title: incident.incidentTitle ?? "Incident",
          children: [
            _tile("Asset", incident.asset?.assetName ?? ""),
            _tile("Risk", incident.risk?.riskTitle ?? ""),
            _tile("Reported By", incident.reportedBy?.fullName ?? ""),
            _tile("Description", incident.description ?? ""),
            _tile("Severity", incident.severity ?? ""),
            _tile("Status", incident.status.toString()),
            _tile("Date", incident.incidentDate ?? ""),
          ],
        ),
      ),
    );
  }

  // ==============================
  // RISK DETAILS
  // ==============================
  static void _showRiskDetails(RiskEntity risk) {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: Get.height * 0.8,
        // FIX: backgroundColor is correctly assigned via decoration
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: _buildSheet(
          icon: Icons.security,
          color: Colors.orange,
          title: risk.riskTitle ?? "Risk",
          children: [
            _tile("Description", risk.riskDescription ?? ""),
            _tile("Likelihood", risk.likelihood ?? ""),
            _tile("Severity", risk.severity ?? ""),
            _tile("Risk Level", risk.riskLevel ?? ""),
            _tile("Status", risk.status ?? ""),
          ],
        ),
      ),
    );
  }

  // ==============================
  // REUSABLE UI SHEET
  // ==============================
  static Widget _buildSheet({
    required IconData icon,
    required Color color,
    required String title,
    required List<Widget> children,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 40),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  // ==============================
  // LIST TILE BUILDER
  // ==============================
  static Widget _tile(String title, String value) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(value),
      leading: const Icon(Icons.arrow_right),
    );
  }
}
