/// notify_id : "c9b9f5bc-7227-48d1-98dc-f201be7b50c6"
/// sender_id : "cmqj92ykl0004tde2q85msxec"
/// receiver_id : "cmqmdvbeb0006xme2d741kzwq"
/// title : "Task assigned"
/// content : "add more oil"
/// notify_type : "CAPA"
/// reference_id : "cmqndnwzg00051pe22ea7c3sq"
/// is_read : false
/// createdAt : "2026-06-21T06:00:24.154Z"
/// receiver : {"userId":"cmqmdvbeb0006xme2d741kzwq","fullName":"juma","email":"juma@gmail.com","password":"123","role":"TECHNICIAN","phone":"0798765432","playerId":"bda3a186-5e4d-44df-8312-911c68f6a97c","status":"ACTIVE","isApproved":false,"createdAt":"2026-06-20T13:18:22.835Z","updatedAt":"2026-06-20T13:18:22.835Z"}
/// sender : {"userId":"cmqj92ykl0004tde2q85msxec","fullName":"estate01","email":"estate01@gmail.com","password":null,"role":"ESTATE_MANAGER","phone":"069259480","playerId":null,"status":"ACTIVE","isApproved":false,"createdAt":"2026-06-18T08:41:02.853Z","updatedAt":"2026-06-18T08:41:02.853Z"}

class Sss {
  Sss({
      this.notifyId, 
      this.senderId, 
      this.receiverId, 
      this.title, 
      this.content, 
      this.notifyType, 
      this.referenceId, 
      this.isRead, 
      this.createdAt, 
      this.receiver, 
      this.sender,});

  Sss.fromJson(dynamic json) {
    notifyId = json['notify_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    title = json['title'];
    content = json['content'];
    notifyType = json['notify_type'];
    referenceId = json['reference_id'];
    isRead = json['is_read'];
    createdAt = json['createdAt'];
    receiver = json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null;
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
  }
  String? notifyId;
  String? senderId;
  String? receiverId;
  String? title;
  String? content;
  String? notifyType;
  String? referenceId;
  bool? isRead;
  String? createdAt;
  Receiver? receiver;
  Sender? sender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notify_id'] = notifyId;
    map['sender_id'] = senderId;
    map['receiver_id'] = receiverId;
    map['title'] = title;
    map['content'] = content;
    map['notify_type'] = notifyType;
    map['reference_id'] = referenceId;
    map['is_read'] = isRead;
    map['createdAt'] = createdAt;
    if (receiver != null) {
      map['receiver'] = receiver?.toJson();
    }
    if (sender != null) {
      map['sender'] = sender?.toJson();
    }
    return map;
  }

}

/// userId : "cmqj92ykl0004tde2q85msxec"
/// fullName : "estate01"
/// email : "estate01@gmail.com"
/// password : null
/// role : "ESTATE_MANAGER"
/// phone : "069259480"
/// playerId : null
/// status : "ACTIVE"
/// isApproved : false
/// createdAt : "2026-06-18T08:41:02.853Z"
/// updatedAt : "2026-06-18T08:41:02.853Z"

class Sender {
  Sender({
      this.userId, 
      this.fullName, 
      this.email, 
      this.password, 
      this.role, 
      this.phone, 
      this.playerId, 
      this.status, 
      this.isApproved, 
      this.createdAt, 
      this.updatedAt,});

  Sender.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    playerId = json['playerId'];
    status = json['status'];
    isApproved = json['isApproved'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? userId;
  String? fullName;
  String? email;
  dynamic password;
  String? role;
  String? phone;
  dynamic playerId;
  String? status;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['phone'] = phone;
    map['playerId'] = playerId;
    map['status'] = status;
    map['isApproved'] = isApproved;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

/// userId : "cmqmdvbeb0006xme2d741kzwq"
/// fullName : "juma"
/// email : "juma@gmail.com"
/// password : "123"
/// role : "TECHNICIAN"
/// phone : "0798765432"
/// playerId : "bda3a186-5e4d-44df-8312-911c68f6a97c"
/// status : "ACTIVE"
/// isApproved : false
/// createdAt : "2026-06-20T13:18:22.835Z"
/// updatedAt : "2026-06-20T13:18:22.835Z"

class Receiver {
  Receiver({
      this.userId, 
      this.fullName, 
      this.email, 
      this.password, 
      this.role, 
      this.phone, 
      this.playerId, 
      this.status, 
      this.isApproved, 
      this.createdAt, 
      this.updatedAt,});

  Receiver.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    playerId = json['playerId'];
    status = json['status'];
    isApproved = json['isApproved'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? userId;
  String? fullName;
  String? email;
  String? password;
  String? role;
  String? phone;
  String? playerId;
  String? status;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['phone'] = phone;
    map['playerId'] = playerId;
    map['status'] = status;
    map['isApproved'] = isApproved;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}