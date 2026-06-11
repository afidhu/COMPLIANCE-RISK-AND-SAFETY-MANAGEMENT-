import 'package:equatable/equatable.dart';

import '../../../assets/domain/entities/assets_entity.dart';
import '../../../auths/domain/entities/user_entity.dart';

class HazardsEntity extends Equatable {
  final String? hazardId;
  final String? assetId;
  final AssetsEntity? asset;
  final String? complianceId;
  final String? hazardTitle;
  final String? hazardDescription;
  final UserEntity? reportedBy;
  final String? reportedById;
  final String? status;
  final String? createdAt;

  const HazardsEntity({
    this.hazardId,
    this.assetId,
    this.asset,
    this.complianceId,
    this.hazardTitle,
    this.hazardDescription,
    this.reportedBy,
    this.reportedById,
    this.status,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        hazardId,
        assetId,
    asset,
        complianceId,
        hazardTitle,
        hazardDescription,
        reportedById,
    reportedBy,
        status,
        createdAt,
      ];
}
