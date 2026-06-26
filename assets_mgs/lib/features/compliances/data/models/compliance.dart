import '../../../assets/data/models/assets_model.dart';
import '../../domain/entities/compliance_entity.dart';

/// complianceId : "cmq3skq8j00001ze2g2276chm"
/// complianceName : "Fire Safety Inspection"
/// assetId : "cmq3rok1g00007me298pkhi4n"
/// frequency : "Monthly"
/// lastDueDate : "2026-05-01T00:00:00.000Z"
/// dueDate : "2026-06-01T00:00:00.000Z"
/// status : "COMPLIANT"
/// createdAt : "2026-06-07T13:02:25.747Z"
/// updatedAt : "2026-06-07T13:02:25.747Z"

class ComplianceModel extends ComplianceEntity {
 const ComplianceModel({
      super.complianceId,
      super.complianceName,
      super.assetId,
      super.frequency,
      super.lastDueDate,
      super.dueDate,
      super.status,
      super.createdAt,
      super.updatedAt,
      super.asset
 });

 factory ComplianceModel.fromJson(dynamic json) {
    return ComplianceModel(
        complianceId : json['complianceId'],
        complianceName : json['complianceName'],
        assetId : json['assetId'],
        frequency : json['frequency'],
        lastDueDate : json['lastDueDate'],
        dueDate : json['dueDate'],
        status : json['status'],
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],
        asset : json['asset'] != null ? AssetsModel.fromJson(json['asset']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'complianceId' : complianceId,
      'complianceName' : complianceName,
      'assetId' : assetId,
      'frequency' : frequency,
      'lastDueDate' : lastDueDate,
      'dueDate' : dueDate,
      'status' : status,
      'createdAt' : createdAt,
      'updatedAt': updatedAt
    };
    // return map;
  }

  factory ComplianceModel.fromEntity(ComplianceEntity compliance){
   return ComplianceModel(
     status: compliance.status,
     updatedAt: compliance.updatedAt,
     asset: compliance.asset,
     assetId: compliance.assetId,
     dueDate: compliance.dueDate,
     lastDueDate: compliance.lastDueDate,
     complianceId: compliance.complianceId,
     complianceName: compliance.complianceName,
     createdAt: compliance.createdAt,
     frequency: compliance.frequency
   );
  }

}