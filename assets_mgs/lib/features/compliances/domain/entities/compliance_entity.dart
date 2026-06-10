

import 'package:equatable/equatable.dart';

class ComplianceEntity extends Equatable {
  final String? complianceId;
  final String? complianceName;
  final String? assetId;
  final String? frequency;
  final String? lastDueDate;
  final String? dueDate;
  final String? status;
  final String? createdAt;
  final String? updatedAt;


const  ComplianceEntity({
    this.complianceId,
    this.complianceName,
    this.assetId,
    this.frequency,
    this.lastDueDate,
    this.dueDate,
    this.status,
    this.createdAt,
    this.updatedAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [complianceId,
  complianceName,
  assetId,
  frequency,
  lastDueDate,
  dueDate,
  status,
  createdAt,
  updatedAt,];

}