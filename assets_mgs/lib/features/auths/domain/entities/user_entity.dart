import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
 final String? userId;
 final String? fullName;
 final String? email;
 final dynamic password;
 final String? role;
 final bool? isApproved;
 final String? phone;
 final dynamic playerId;
 final String? status;
 final String? createdAt;
 final String? updatedAt;

const UserEntity({
  this.userId,
  this.fullName,
  this.email,
  this.password,
  this.role,
  this.phone,
  this.isApproved,
  this.playerId,
  this.status,
  this.createdAt,
  this.updatedAt,
});

  @override
  // TODO: implement props
  List<Object?> get props =>[
 userId,
 fullName,
 email,
 password,
 role,
    isApproved,
 phone,
 playerId,
 status,
 createdAt,
 updatedAt,
  ];
}