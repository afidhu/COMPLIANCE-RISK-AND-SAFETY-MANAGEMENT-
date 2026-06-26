import '../../../assets/data/models/assets_model.dart';
import '../../../auths/data/models/users_model.dart';
import '../../../risks/data/models/risks_model.dart';
import '../../domain/entities/incident_entity.dart';

/// incidentId : "cmq3vtndk000ad5e2v8x21806"
/// assetId : "cmq3rok1g00007me298pkhi4n"
/// riskId : "cmq3vliwo0007d5e29yq9x4ij"
/// incidentTitle : "Lift Malfunction"
/// description : "Lift stopped suddenly between floors"
/// incidentDate : "2026-05-12T00:00:00.000Z"
/// severity : "MEDIUM"
/// reportedById : "cmq3rfv800001rte2k6ioz6ut"
/// status : null
/// createdAt : "2026-06-07T14:33:20.792Z"
/// asset : {"assetId":"cmq3rok1g00007me298pkhi4n","assetName":"Electric Boiler","assetType":"BOILER","location":"BLOCK B","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-07T12:37:24.724Z","updatedAt":"2026-06-07T12:37:24.724Z"}
/// risk : {"riskId":"cmq3vliwo0007d5e29yq9x4ij","hazardId":"cmq3vb19g0002d5e2c24ittfn","riskTitle":"Emergency Evacuation Failure","riskDescription":"Blocked exits or unsafe conditions may delay evacuation during emergencies, increasing the likelihood of casualties.","likelihood":"POSSIBLE","severity":"MEDIUM","riskLevel":null,"status":"OPEN","createdAt":"2026-06-07T14:27:01.752Z","updatedAt":"2026-06-07T14:27:01.752Z"}

class IncidentModel extends IncidentEntity{
  IncidentModel({
      super.incidentId,
      super.assetId,
      super.riskId,
      super.incidentTitle,
      super.description,
      super.incidentDate,
      super.severity,
      super.reportedById,
      super.reportedBy,
      super.status,
      super.createdAt,
      super.asset,
      super.risk,});

  factory IncidentModel.fromJson(dynamic json) {
    return IncidentModel(
        incidentId : json['incidentId'],
        assetId : json['assetId'],
        riskId : json['riskId'],
        incidentTitle : json['incidentTitle'],
        description : json['description'],
        reportedBy : json['reportedBy'] != null ? UsersModel.fromJson(json['reportedBy']) : null,
        incidentDate : json['incidentDate'],
        severity : json['severity'],
        reportedById : json['reportedById'],
        status : json['status'],
        createdAt : json['createdAt'],
        asset : json['asset'] != null ? AssetsModel.fromJson(json['asset']) : null,
         risk : json['risk'] != null ? RisksModel.fromJson(json['risk']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'incidentId':incidentId,
      'assetId': assetId,
      'riskId': riskId,
      'incidentTitle': incidentTitle,
      'description': description,
      'incidentDate': incidentDate,
      'severity': severity,
      'reportedById': reportedById,
      'status': status,
      'createdAt': createdAt,
    };

    // if (asset != null) {
    //   map['asset'] = asset?.toJson();
    // }
    // if (risk != null) {
    //   map['risk'] = risk?.toJson();
    // }
    // return map;
  }

}