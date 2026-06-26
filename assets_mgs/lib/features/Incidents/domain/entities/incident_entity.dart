

import '../../../assets/domain/entities/assets_entity.dart';
import '../../../auths/domain/entities/user_entity.dart';
import '../../../risks/domain/entities/risk_entity.dart';

class IncidentEntity {
  final String? incidentId;
  final String? assetId;
  final String? riskId;
  final UserEntity? reportedBy;
  final String? incidentTitle;
  final String? description;
  final String? incidentDate;
  final String? severity;
  final String? reportedById;
  final dynamic status;
  final String? createdAt;
  final AssetsEntity? asset;
  final RiskEntity? risk;

  IncidentEntity({
    this.incidentId,
    this.assetId,
    this.reportedBy,
    this.riskId,
    this.incidentTitle,
    this.description,
    this.incidentDate,
    this.severity,
    this.reportedById,
    this.status,
    this.createdAt,
    this.asset,
    this.risk,});
}