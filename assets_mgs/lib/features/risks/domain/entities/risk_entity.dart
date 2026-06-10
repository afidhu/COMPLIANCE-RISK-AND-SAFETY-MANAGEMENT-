

import 'package:equatable/equatable.dart';

class RiskEntity extends Equatable {
  final String? riskId;
  final String? hazardId;
  final String? riskTitle;
  final String? riskDescription;
  final String? likelihood;
  final String? severity;
  final dynamic riskLevel;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

 const RiskEntity({
    this.riskId,
    this.hazardId,
    this.riskTitle,
    this.riskDescription,
    this.likelihood,
    this.severity,
    this.riskLevel,
    this.status,
    this.createdAt,
    this.updatedAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [riskId,
  hazardId,
  riskTitle,
  riskDescription,
  likelihood,
  severity,
  riskLevel,
  status,
  createdAt,
  updatedAt,];
}

