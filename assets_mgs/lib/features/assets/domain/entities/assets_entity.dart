
import 'package:equatable/equatable.dart';

class AssetsEntity extends Equatable{
 final String? assetId;
 final String? assetName;
 final String? assetType;
 final String? location;
 final dynamic serialNo;
 final String? status;
 final String? createdById;
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
    this.updatedAt,});

  @override
  // TODO: implement props
  List<Object?> get props =>[assetId,
 assetName,
 assetType,
 location,
 serialNo,
 status,
 createdById,
 createdAt,
 updatedAt];
}