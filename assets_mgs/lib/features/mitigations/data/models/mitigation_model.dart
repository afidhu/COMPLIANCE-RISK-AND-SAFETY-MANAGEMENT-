import '../../../hazards/data/models/hazard_models.dart';
import '../../domain/entities/mitigation_entity.dart';

/// mitigationId : "cmq49kde9000002e2s9aim2or"
/// riskId : "cmq3vjm5j0003d5e28d8m32zt"
/// actionTitle : "Review security controls"
/// assignedToId : "cmq3r9t6n0000rte28j0zvojs"
/// targetDate : "2026-06-15T00:00:00.000Z"
/// status : "PENDING"
/// createdAt : "2026-06-07T20:58:02.577Z"

class MitigationModel extends MitigationEntity {
 const MitigationModel({
      super.mitigationId,
      super.riskId,
      super.actionTitle,
      super.assignedToId,
      super.targetDate,
      super.status,
      super.hazards,
      super.createdAt,});

 factory MitigationModel.fromJson(dynamic json) {
    return MitigationModel(
        mitigationId : json['mitigationId'],
        riskId : json['riskId'],
        actionTitle : json['actionTitle'],
        assignedToId : json['assignedToId'],
        targetDate : json['targetDate'],
        status : json['status'],
        createdAt : json['createdAt'],
      hazards:json['hazard'] != null ? HazardModels.fromJson(json['hazard']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'mitigationId': mitigationId,
      'riskId' : riskId,
      'actionTitle' : actionTitle,
      'assignedToId' : assignedToId,
      'targetDate' : targetDate,
      'status' : status,
      'createdAt': createdAt,
    };

    // return map;
  }

}