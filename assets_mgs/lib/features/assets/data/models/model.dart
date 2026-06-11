/// assetId : "cmq3rie760002rte2wd2llont"
/// assetName : "Generator"
/// assetType : "ELECTRICAL_DEVICE"
/// location : "BLOCK A"
/// serialNo : null
/// status : "ACTIVE"
/// createdById : "cmq3rfv800001rte2k6ioz6ut"
/// createdAt : "2026-06-07T12:32:37.218Z"
/// updatedAt : "2026-06-07T12:32:37.218Z"
/// compliances : []

class Model {
  Model({
      this.assetId, 
      this.assetName, 
      this.assetType, 
      this.location, 
      this.serialNo, 
      this.status, 
      this.createdById, 
      this.createdAt, 
      this.updatedAt, 
      this.compliances,});

  Model.fromJson(dynamic json) {
    assetId = json['assetId'];
    assetName = json['assetName'];
    assetType = json['assetType'];
    location = json['location'];
    serialNo = json['serialNo'];
    status = json['status'];
    createdById = json['createdById'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['compliances'] != null) {
      compliances = [];
      json['compliances'].forEach((v) {
        compliances?.add(Dynamic.fromJson(v));
      });
    }
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
  List<dynamic>? compliances;

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
    if (compliances != null) {
      map['compliances'] = compliances?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}