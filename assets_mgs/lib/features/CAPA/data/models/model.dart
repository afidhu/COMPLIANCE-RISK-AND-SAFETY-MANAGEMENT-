/// capaId : "cmq49slhn000202e2eqbo9grx"
/// riskId : "cmq3vjm5j0003d5e28d8m32zt"
/// hazardId : "cmq3vb19g0002d5e2c24ittfn"
/// actionTitle : "Replace asset"
/// actionType : "CORRECTIVE"
/// assignedToId : "cmq3r9t6n0000rte28j0zvojs"
/// dueDate : "2026-06-15T00:00:00.000Z"
/// status : "PENDING"
/// createdAt : "2026-06-07T21:04:26.315Z"
/// assignedTo : {"userId":"cmq3r9t6n0000rte28j0zvojs","fullName":"inspector1","email":"inspector1@gmail.com","role":"INSPECTOR","phone":"062259420","status":"ACTIVE","createdAt":"2026-06-07T12:25:56.735Z","updatedAt":"2026-06-07T12:25:56.735Z"}

class Model {
  Model({
      this.capaId, 
      this.riskId, 
      this.hazardId, 
      this.actionTitle, 
      this.actionType, 
      this.assignedToId, 
      this.dueDate, 
      this.status, 
      this.createdAt, 
      this.assignedTo,});

  Model.fromJson(dynamic json) {
    capaId = json['capaId'];
    riskId = json['riskId'];
    hazardId = json['hazardId'];
    actionTitle = json['actionTitle'];
    actionType = json['actionType'];
    assignedToId = json['assignedToId'];
    dueDate = json['dueDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    assignedTo = json['assignedTo'] != null ? AssignedTo.fromJson(json['assignedTo']) : null;
  }
  String? capaId;
  String? riskId;
  String? hazardId;
  String? actionTitle;
  String? actionType;
  String? assignedToId;
  String? dueDate;
  String? status;
  String? createdAt;
  AssignedTo? assignedTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['capaId'] = capaId;
    map['riskId'] = riskId;
    map['hazardId'] = hazardId;
    map['actionTitle'] = actionTitle;
    map['actionType'] = actionType;
    map['assignedToId'] = assignedToId;
    map['dueDate'] = dueDate;
    map['status'] = status;
    map['createdAt'] = createdAt;
    if (assignedTo != null) {
      map['assignedTo'] = assignedTo?.toJson();
    }
    return map;
  }

}

/// userId : "cmq3r9t6n0000rte28j0zvojs"
/// fullName : "inspector1"
/// email : "inspector1@gmail.com"
/// role : "INSPECTOR"
/// phone : "062259420"
/// status : "ACTIVE"
/// createdAt : "2026-06-07T12:25:56.735Z"
/// updatedAt : "2026-06-07T12:25:56.735Z"

class AssignedTo {
  AssignedTo({
      this.userId, 
      this.fullName, 
      this.email, 
      this.role, 
      this.phone, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  AssignedTo.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? userId;
  String? fullName;
  String? email;
  String? role;
  String? phone;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['email'] = email;
    map['role'] = role;
    map['phone'] = phone;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}