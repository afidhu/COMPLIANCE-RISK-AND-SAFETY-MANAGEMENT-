

import 'dart:io';

import 'package:assets_mgs/features/auths/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../hazards/domain/entities/hazards_entity.dart';

class CapaEntity extends Equatable{
 final String? capaId;
 final String? riskId;
 final String? actionTitle;
 final String? actionType;
 final String? assignedToId;
 final UserEntity? assignedTo;
 final HazardsEntity? hazards;
 final String? dueDate;
 final String? status;
 final File? imageFile;
 final String? createdAt;

const CapaEntity({
    this.capaId,
    this.riskId,
    this.actionTitle,
    this.actionType,
    this.assignedToId,
    this.assignedTo,
    this.dueDate,
    this.status,
  this.imageFile,
    this.hazards,
    this.createdAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [
 capaId,
 riskId,
 actionTitle,
 actionType,
 assignedToId,
    assignedTo,
 dueDate,
 status,
 createdAt,
    hazards,
    imageFile
  ];
}