

import 'package:equatable/equatable.dart';

class CapaEntity extends Equatable{
 final String? capaId;
 final String? riskId;
 final String? actionTitle;
 final String? actionType;
 final String? assignedToId;
 final String? dueDate;
 final String? status;
 final String? createdAt;

const CapaEntity({
    this.capaId,
    this.riskId,
    this.actionTitle,
    this.actionType,
    this.assignedToId,
    this.dueDate,
    this.status,
    this.createdAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [
 capaId,
 riskId,
 actionTitle,
 actionType,
 assignedToId,
 dueDate,
 status,
 createdAt,
  ];
}