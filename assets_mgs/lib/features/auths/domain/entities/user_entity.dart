import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
 final String? userId;
 final String? fullName;
 final String? email;
 final String? role;
 final String? phone;
 final String? status;
 final String? createdAt;
 final String? updatedAt;

const UserEntity({
    this.userId,
    this.fullName,
    this.email,
    this.role,
    this.phone,
    this.status,
    this.createdAt,
    this.updatedAt,});

  @override
  // TODO: implement props
  List<Object?> get props =>[userId,
 fullName,
 email,
 role,
 phone,
 status,
 createdAt,
 updatedAt];
}