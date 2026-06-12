import 'package:equatable/equatable.dart';

import '../../../compliances/domain/entities/compliance_entity.dart';

class AssetsEntity extends Equatable {
  final String? assetId;
  final String? assetName;
  final String? assetType;
  final String? location;
  final dynamic serialNo;
  final String? status;
  final String? createdById;
  final List<ComplianceEntity>? compliance;
  final String? createdAt;
  final String? updatedAt;

  const AssetsEntity({
    this.assetId,
    this.assetName,
    this.assetType,
    this.location,
    this.serialNo,
    this.status,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.compliance,
  });

  @override
  List<Object?> get props => [
        assetId,
        assetName,
        assetType,
        location,
        serialNo,
        status,
        createdById,
        createdAt,
        updatedAt,
        compliance,
      ];
}
