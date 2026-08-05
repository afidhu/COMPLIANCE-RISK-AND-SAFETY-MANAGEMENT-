import 'package:assets_mgs/features/auths/data/models/users_model.dart';

import '../../../hazards/data/models/hazard_models.dart';
import '../../domain/entities/capa_entity.dart';

/// capaId : "cmq49slhn000202e2eqbo9grx"
/// riskId : "cmq3vjm5j0003d5e28d8m32zt"
/// actionTitle : "Replace asset"
/// actionType : "CORRECTIVE"
/// assignedToId : "cmq3r9t6n0000rte28j0zvojs"
/// dueDate : "2026-06-15T00:00:00.000Z"
/// status : "PENDING"
/// createdAt : "2026-06-07T21:04:26.315Z"

class CapaModel extends CapaEntity {
 const CapaModel({
      super.capaId,
      super.riskId,
      super.actionTitle,
      super.actionType,
      super.assignedToId,
      super.assignedTo,
      super.dueDate,
      super.status,
      super.hazards,
      super.imageFile,
      super.createdAt,});



 factory CapaModel.fromJson(dynamic json) {
    return CapaModel(
        capaId : json['capaId'],
        riskId : json['riskId'],
        actionTitle : json['actionTitle'],
        actionType : json['actionType'],
        assignedToId : json['assignedToId'],
        dueDate : json['dueDate'],
        status : json['status'],
        // imageFile : json['imageUrl'],
        createdAt : json['createdAt'],
        assignedTo:json['assignedTo'] != null ? UsersModel.fromJson(json['assignedTo']) : null,
        hazards:json['hazard'] != null ? HazardModels.fromJson(json['hazard']) : null,
    );
  }

  factory CapaModel.fromEntity(CapaEntity capa){
   return CapaModel(
     status: capa.status,
     imageFile: capa.imageFile,
   );
  }


  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'capaId' : capaId,
      'riskId': riskId,
      'actionTitle': actionTitle,
      'actionType' : actionType,
      'assignedToId': assignedToId,
      'file':null,
      'dueDate': dueDate,
      'status' : status,
      'createdAt' : createdAt
    };

    // return map;
  }

}