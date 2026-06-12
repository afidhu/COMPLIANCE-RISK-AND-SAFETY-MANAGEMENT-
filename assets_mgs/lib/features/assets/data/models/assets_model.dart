import 'package:assets_mgs/features/compliances/data/models/compliance.dart';

import '../../domain/entities/assets_entity.dart';

/// assetId : "cmq3rie760002rte2wd2llont"
/// assetName : "Generator"
/// assetType : "ELECTRICAL_DEVICE"
/// location : "BLOCK A"
/// serialNo : null
/// status : "ACTIVE"
/// createdById : "cmq3rfv800001rte2k6ioz6ut"
/// createdAt : "2026-06-07T12:32:37.218Z"
/// updatedAt : "2026-06-07T12:32:37.218Z"

class AssetsModel extends AssetsEntity {
  const AssetsModel({
    super.assetId,
    super.assetName,
    super.assetType,
    super.location,
    super.serialNo,
    super.status,
    super.createdById,
    super.createdAt,
    super.updatedAt,
    super.compliance,
  });

  factory AssetsModel.fromJson(dynamic json) {
    return AssetsModel(
      assetId: json['assetId'],
      assetName: json['assetName'],
      assetType: json['assetType'],
      location: json['location'],
      serialNo: json['serialNo'],
      status: json['status'],
      createdById: json['createdById'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      compliance: json['compliances'] != null
          ? (json['compliances'] as List)
              .map((e) => ComplianceModel.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetId': assetId,
      'assetName': assetName,
      'assetType': assetType,
      'location': location,
      'serialNo': serialNo,
      'status': status,
      'createdById': createdById,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'compliances': compliance?.map((e) {
        if (e is ComplianceModel) return e.toJson();
        // If it's just a ComplianceEntity, we might need a way to convert it, 
        // but usually in Data layer they are ComplianceModels.
        return null; // Or handle appropriately
      }).toList(),
    };
  }
}
