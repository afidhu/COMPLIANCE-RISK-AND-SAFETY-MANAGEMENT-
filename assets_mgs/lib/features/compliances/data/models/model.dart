/// complianceId : "cmq3skq8j00001ze2g2276chm"
/// complianceName : "Fire Safety Inspection"
/// assetId : "cmq3rok1g00007me298pkhi4n"
/// frequency : "Monthly"
/// lastDueDate : "2026-05-01T00:00:00.000Z"
/// dueDate : "2026-06-01T00:00:00.000Z"
/// status : "COMPLIANT"
/// createdAt : "2026-06-07T13:02:25.747Z"
/// updatedAt : "2026-06-07T13:02:25.747Z"
/// asset : {"assetId":"cmq3rok1g00007me298pkhi4n","assetName":"Electric Boiler","assetType":"BOILER","location":"BLOCK B","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-07T12:37:24.724Z","updatedAt":"2026-06-07T12:37:24.724Z"}

class Model {
  Model({
      this.complianceId, 
      this.complianceName, 
      this.assetId, 
      this.frequency, 
      this.lastDueDate, 
      this.dueDate, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.asset,});

  Model.fromJson(dynamic json) {
    complianceId = json['complianceId'];
    complianceName = json['complianceName'];
    assetId = json['assetId'];
    frequency = json['frequency'];
    lastDueDate = json['lastDueDate'];
    dueDate = json['dueDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
  }
  String? complianceId;
  String? complianceName;
  String? assetId;
  String? frequency;
  String? lastDueDate;
  String? dueDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  Asset? asset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['complianceId'] = complianceId;
    map['complianceName'] = complianceName;
    map['assetId'] = assetId;
    map['frequency'] = frequency;
    map['lastDueDate'] = lastDueDate;
    map['dueDate'] = dueDate;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (asset != null) {
      map['asset'] = asset?.toJson();
    }
    return map;
  }

}

/// assetId : "cmq3rok1g00007me298pkhi4n"
/// assetName : "Electric Boiler"
/// assetType : "BOILER"
/// location : "BLOCK B"
/// serialNo : null
/// status : "ACTIVE"
/// createdById : "cmq3rfv800001rte2k6ioz6ut"
/// createdAt : "2026-06-07T12:37:24.724Z"
/// updatedAt : "2026-06-07T12:37:24.724Z"

class Asset {
  Asset({
      this.assetId, 
      this.assetName, 
      this.assetType, 
      this.location, 
      this.serialNo, 
      this.status, 
      this.createdById, 
      this.createdAt, 
      this.updatedAt,});

  Asset.fromJson(dynamic json) {
    assetId = json['assetId'];
    assetName = json['assetName'];
    assetType = json['assetType'];
    location = json['location'];
    serialNo = json['serialNo'];
    status = json['status'];
    createdById = json['createdById'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? assetId;
  String? assetName;
  String? assetType;
  String? location;
  dynamic serialNo;
  String? status;
  String? createdById;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['assetId'] = assetId;
    map['assetName'] = assetName;
    map['assetType'] = assetType;
    map['location'] = location;
    map['serialNo'] = serialNo;
    map['status'] = status;
    map['createdById'] = createdById;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}