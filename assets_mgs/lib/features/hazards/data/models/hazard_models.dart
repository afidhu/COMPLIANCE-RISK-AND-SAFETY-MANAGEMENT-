import '../../../assets/data/models/assets_model.dart';
import '../../../auths/data/models/users_model.dart';
import '../../domain/entities/hazards_entity.dart';

/// hazardId : "cmq3us1wo0000oae2kxcu2yef"
/// assetId : "cmq3rok1g00007me298pkhi4n"
/// complianceId : "cmq3t3yq800071ze2a1nx1shs"
/// hazardTitle : "Lift Door Malfunction"
/// hazardDescription : "Lift doors are not closing properly and may trap passengers."
/// reportedById : "cmq3r9t6n0000rte28j0zvojs"
/// status : "OPEN"
/// createdAt : "2026-06-07T14:04:06.696Z"

class HazardModels  extends HazardsEntity{
  const HazardModels({
      super.hazardId,
      super.assetId,
      super.asset,
      super.complianceId,
      super.hazardTitle,
      super.hazardDescription,
      super.reportedBy,
      super.reportedById,
      super.status,
      super.createdAt,});

 factory HazardModels.fromJson(dynamic json) {
    return HazardModels(
        hazardId : json['hazardId'],
        assetId :json['assetId'],
        complianceId :json['complianceId'],
        hazardTitle:json['hazardTitle'],
        hazardDescription : json['hazardDescription'],
        reportedById : json['reportedById'],
        reportedBy :json['reportedBy'] != null ? UsersModel.fromJson(json['reportedBy']) : null,
        asset :json['asset'] != null ? AssetsModel.fromJson(json['asset']) : null,
        status : json['status'],
        createdAt : json['createdAt'],
    );
  }
  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'hazardId' : hazardId,
      'assetId' : assetId,
      'complianceId' : complianceId,
      'hazardTitle' : hazardTitle,
      'hazardDescription' : hazardDescription,
      'reportedById' : reportedById,
      'status' : status,
      'createdAt': createdAt,
    };
  }

}