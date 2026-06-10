import 'package:equatable/equatable.dart';

class HazardsEntity extends Equatable {
  final String? hazardId;
  final String? assetId;
  final String? complianceId;
  final String? hazardTitle;
  final String? hazardDescription;
  final String? reportedById;
  final String? status;
  final String? createdAt;

  const HazardsEntity({
    this.hazardId,
    this.assetId,
    this.complianceId,
    this.hazardTitle,
    this.hazardDescription,
    this.reportedById,
    this.status,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        hazardId,
        assetId,
        complianceId,
        hazardTitle,
        hazardDescription,
        reportedById,
        status,
        createdAt,
      ];
}
