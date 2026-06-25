import '../../domain/entities/user_entity.dart';

/// userId : "cmq3r9t6n0000rte28j0zvojs"
/// fullName : "inspector1"
/// email : "inspector1@gmail.com"
/// password : null
/// role : "INSPECTOR"
/// phone : "062259420"
/// playerId : null
/// status : "ACTIVE"
/// createdAt : "2026-06-07T12:25:56.735Z"
/// updatedAt : "2026-06-07T12:25:56.735Z"

class UsersModel extends UserEntity {
  const UsersModel({
    super.userId,
    super.fullName,
    super.email,
    super.isApproved,
    super.password,
    super.role,
    super.phone,
    super.playerId,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  factory UsersModel.fromJson(dynamic json) {
    return UsersModel(
      userId: json['userId'],
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      isApproved :json['isApproved'],
      role: json['role'],
      phone: json['phone'],
      playerId: json['playerId'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'password': password,
      'role': role,
      "isApproved":isApproved,
      'phone': phone,
      'playerId': playerId,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UsersModel.fromEntity(UserEntity user) {
    return UsersModel(
      userId: user.userId,
      fullName: user.fullName,
      email: user.email,
      password: user.password,
      role: user.role,
      phone: user.phone,
      isApproved:user.isApproved,
      playerId: user.playerId,
      status: user.status,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}
