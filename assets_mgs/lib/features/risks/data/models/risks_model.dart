import 'package:assets_mgs/features/hazards/data/models/hazard_models.dart';

import '../../domain/entities/risk_entity.dart';

/// riskId : "cmq3vjm5j0003d5e28d8m32zt"
/// hazardId : "cmq3vb19g0002d5e2c24ittfn"
/// riskTitle : "Electric Shock"
/// riskDescription : "Exposure to live electrical wires may result in serious injury or fatal electric shock."
/// likelihood : "POSSIBLE"
/// severity : "MEDIUM"
/// riskLevel : null
/// status : "OPEN"
/// createdAt : "2026-06-07T14:25:32.647Z"
/// updatedAt : "2026-06-07T14:25:32.647Z"

class RisksModel extends RiskEntity {
 const RisksModel({
      super.riskId,
      super.hazard,
      super.hazardId,
      super.riskTitle,
      super.riskDescription,
      super.likelihood,
      super.severity,
      super.riskLevel,
      super.status,
      super.createdAt,
      super.updatedAt,});

  factory RisksModel.fromJson(dynamic json) {
    return  RisksModel(
        riskId : json['riskId'],
        hazardId : json['hazardId'],
        hazard :json['hazard'] != null ? HazardModels.fromJson(json['hazard']) : null,
        riskTitle: json['riskTitle'],
        riskDescription : json['riskDescription'],
        likelihood : json['likelihood'],
        severity : json['severity'],
        riskLevel : json['riskLevel'],
        status : json['status'],
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],
    );

  }

  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'riskId' : riskId,
      'hazardId' : hazardId,
      'riskTitle' : riskTitle,
      'riskDescription': riskDescription,
      'likelihood' : likelihood,
      'severity' : severity,
      'riskLevel' : riskLevel,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };

    // return map;
  }

}