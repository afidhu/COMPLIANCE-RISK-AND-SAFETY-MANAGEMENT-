/// riskId : "cmq3vjm5j0003d5e28d8m32zt"
/// hazardId : "cmq3vb19g0002d5e2c24ittfn"
/// riskTitle : "Electric Shock"
/// riskDescription : "Exposure to live electrical wires may result in serious injury or fatal electric shock."
/// likelihood : "POSSIBLE"
/// severity : "MEDIUM"
/// riskLevel : null
/// status : "OPEN"
/// createdAt : "2026-06-07T14:25:32.647Z"
/// updatedAt : "2026-06-07T14:25:32.647Z"
/// hazard : {"hazardId":"cmq3vb19g0002d5e2c24ittfn","assetId":"cmq3rok1g00007me298pkhi4n","complianceId":"cmq3t3yq800071ze2a1nx1shs","hazardTitle":"Pressure Leakage","hazardDescription":"Boiler pressure valve leaking steam and requiring immediate maintenance.","reportedById":"cmq3r9t6n0000rte28j0zvojs","status":"CLOSED","createdAt":"2026-06-07T14:18:52.324Z","asset":{"assetId":"cmq3rok1g00007me298pkhi4n","assetName":"Electric Boiler","assetType":"BOILER","location":"BLOCK B","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-07T12:37:24.724Z","updatedAt":"2026-06-07T12:37:24.724Z"}}

class Model {
  Model({
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

  Model.fromJson(dynamic json) {
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

/// hazardId : "cmq3vb19g0002d5e2c24ittfn"
/// assetId : "cmq3rok1g00007me298pkhi4n"
/// complianceId : "cmq3t3yq800071ze2a1nx1shs"
/// hazardTitle : "Pressure Leakage"
/// hazardDescription : "Boiler pressure valve leaking steam and requiring immediate maintenance."
/// reportedById : "cmq3r9t6n0000rte28j0zvojs"
/// status : "CLOSED"
/// createdAt : "2026-06-07T14:18:52.324Z"
/// asset : {"assetId":"cmq3rok1g00007me298pkhi4n","assetName":"Electric Boiler","assetType":"BOILER","location":"BLOCK B","serialNo":null,"status":"ACTIVE","createdById":"cmq3rfv800001rte2k6ioz6ut","createdAt":"2026-06-07T12:37:24.724Z","updatedAt":"2026-06-07T12:37:24.724Z"}

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
  String? complianceId;
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