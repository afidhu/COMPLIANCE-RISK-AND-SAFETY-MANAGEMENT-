

import 'package:equatable/equatable.dart';

class MitigationEntity  extends Equatable{
  final String? mitigationId;
  final String? riskId;
  final String? actionTitle;
  final String? assignedToId;
  final String? targetDate;
  final String? status;
  final String? createdAt;

 const MitigationEntity({
    this.mitigationId,
    this.riskId,
    this.actionTitle,
    this.assignedToId,
    this.targetDate,
    this.status,
    this.createdAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [mitigationId,
  riskId,
  actionTitle,
  assignedToId,
  targetDate,
  status,
  createdAt];
}