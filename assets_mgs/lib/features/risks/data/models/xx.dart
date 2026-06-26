/// riskId : "cmqkfedsw0000nme24sodp2cg"
/// hazardId : "cmqkdvrdp0000xoe22v1vmaeg"
/// riskTitle : "people may die"
/// riskDescription : "this will.be very dangerous "
/// likelihood : "POSSIBLE"
/// severity : "HIGH"
/// riskLevel : null
/// status : "OPEN"
/// createdAt : "2026-06-19T04:25:39.681Z"
/// updatedAt : "2026-06-19T04:25:39.681Z"
/// hazard : {"hazardId":"cmqkdvrdp0000xoe22v1vmaeg","assetId":"cmqby5byj0002n8e2qvhwd1uf","complianceId":null,"hazardTitle":"Missed Compliance - Daily Fuel System Inspection","hazardDescription":"Daily Fuel System Inspection became overdue on 2026-06-16. The required compliance activity was not completed before the due date and may expose the facility to safety, operational, or regulatory risks.","reportedById":"1","status":"OPEN","createdAt":"2026-06-19T03:43:11.197Z","asset":{"assetId":"cmqby5byj0002n8e2qvhwd1uf","assetName":"Generator","assetType":"ELECTRICAL_DEVICE","location":"BLOCK C","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-13T06:00:34.507Z","updatedAt":"2026-06-13T06:00:34.507Z"}}

class Xx {
  Xx({
      this.riskId, 
      this.hazardId, 
      this.riskTitle, 
      this.riskDescription, 
      this.likelihood, 
      this.severity, 
      this.riskLevel, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.hazard,});

  Xx.fromJson(dynamic json) {
    riskId = json['riskId'];
    hazardId = json['hazardId'];
    riskTitle = json['riskTitle'];
    riskDescription = json['riskDescription'];
    likelihood = json['likelihood'];
    severity = json['severity'];
    riskLevel = json['riskLevel'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    hazard = json['hazard'] != null ? Hazard.fromJson(json['hazard']) : null;
  }
  String? riskId;
  String? hazardId;
  String? riskTitle;
  String? riskDescription;
  String? likelihood;
  String? severity;
  dynamic riskLevel;
  String? status;
  String? createdAt;
  String? updatedAt;
  Hazard? hazard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['riskId'] = riskId;
    map['hazardId'] = hazardId;
    map['riskTitle'] = riskTitle;
    map['riskDescription'] = riskDescription;
    map['likelihood'] = likelihood;
    map['severity'] = severity;
    map['riskLevel'] = riskLevel;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (hazard != null) {
      map['hazard'] = hazard?.toJson();
    }
    return map;
  }

}

/// hazardId : "cmqkdvrdp0000xoe22v1vmaeg"
/// assetId : "cmqby5byj0002n8e2qvhwd1uf"
/// complianceId : null
/// hazardTitle : "Missed Compliance - Daily Fuel System Inspection"
/// hazardDescription : "Daily Fuel System Inspection became overdue on 2026-06-16. The required compliance activity was not completed before the due date and may expose the facility to safety, operational, or regulatory risks."
/// reportedById : "1"
/// status : "OPEN"
/// createdAt : "2026-06-19T03:43:11.197Z"
/// asset : {"assetId":"cmqby5byj0002n8e2qvhwd1uf","assetName":"Generator","assetType":"ELECTRICAL_DEVICE","location":"BLOCK C","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-13T06:00:34.507Z","updatedAt":"2026-06-13T06:00:34.507Z"}

class Hazard {
  Hazard({
      this.hazardId, 
      this.assetId, 
      this.complianceId, 
      this.hazardTitle, 
      this.hazardDescription, 
      this.reportedById, 
      this.status, 
      this.createdAt, 
      this.asset,});

  Hazard.fromJson(dynamic json) {
    hazardId = json['hazardId'];
    assetId = json['assetId'];
    complianceId = json['complianceId'];
    hazardTitle = json['hazardTitle'];
    hazardDescription = json['hazardDescription'];
    reportedById = json['reportedById'];
    status = json['status'];
    createdAt = json['createdAt'];
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
  }
  String? hazardId;
  String? assetId;
  dynamic complianceId;
  String? hazardTitle;
  String? hazardDescription;
  String? reportedById;
  String? status;
  String? createdAt;
  Asset? asset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hazardId'] = hazardId;
    map['assetId'] = assetId;
    map['complianceId'] = complianceId;
    map['hazardTitle'] = hazardTitle;
    map['hazardDescription'] = hazardDescription;
    map['reportedById'] = reportedById;
    map['status'] = status;
    map['createdAt'] = createdAt;
    if (asset != null) {
      map['asset'] = asset?.toJson();
    }
    return map;
  }

}

/// assetId : "cmqby5byj0002n8e2qvhwd1uf"
/// assetName : "Generator"
/// assetType : "ELECTRICAL_DEVICE"
/// location : "BLOCK C"
/// serialNo : null
/// status : "ACTIVE"
/// createdById : "cmq3rfv800001rte2k6ioz6ut"
/// createdAt : "2026-06-13T06:00:34.507Z"
/// updatedAt : "2026-06-13T06:00:34.507Z"

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