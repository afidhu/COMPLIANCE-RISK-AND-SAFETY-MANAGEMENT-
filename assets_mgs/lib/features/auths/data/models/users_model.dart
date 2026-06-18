import '../../domain/entities/user_entity.dart';

/// userId : "cmq3r9t6n0000rte28j0zvojs"
/// fullName : "inspector1"
/// email : "inspector1@gmail.com"
/// role : "INSPECTOR"
/// phone : "062259420"
/// status : "ACTIVE"
/// createdAt : "2026-06-07T12:25:56.735Z"
/// updatedAt : "2026-06-07T12:25:56.735Z"

class UsersModel extends UserEntity{
 const UsersModel({
      super.userId,
      super.fullName,
      super.email,
      super.role,
      super.phone,
      super.status,
      super.createdAt,
      super.updatedAt,});

 factory UsersModel.fromJson(dynamic json) {
   return UsersModel(
       userId : json['userId'],
       fullName : json['fullName'],
       email : json['email'],
       role : json['role'],
       phone : json['phone'],
       status : json['status'],
       createdAt : json['createdAt'],
       updatedAt : json['updatedAt'],
   );
  }

  Map<String, dynamic> toJson() {
    // final map = <String, dynamic>{};
   return {
     'userId' : userId,
     'fullName' : fullName,
     'email' : email,
     'role' : role,
     'phone' : phone,
     'status' : status,
     'createdAt' : createdAt,
     'updatedAt' : updatedAt,
   };
    // return map;
  }



  factory UsersModel.fromEntity( UserEntity user){
   return UsersModel(
       userId: user.userId,
     fullName: user.fullName,
       email: user.email,
       role: user.role,
       phone: user.phone,
       status: user.status,
       createdAt: user.createdAt,
       updatedAt: user.updatedAt,
   );
  }

}