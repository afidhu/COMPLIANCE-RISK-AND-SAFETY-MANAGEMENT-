// import 'package:equatable/equatable.dart';
//
// enum PharmacyApprovedStatus{
//   pending,
//   accepted,
//   rejected, approved,
// }
//
// class PharmacyEntity extends Equatable{
//   final int pharmaId;
//   final String pharmaName;
//   final String pharmaAddress;
//   final String pharmaLocation;
//   final String pharmaPhone;
//   final String pharmaEmail;
//   final String pharmaPassword;
//   final String pharmaConfirmPassword;
//   final String pharmaLicense;
//   final String pharmaOpenTime;
//   final String pharmaCloseTime;
//   final String pharmaImage;
//   final  PharmacyApprovedStatus pharmacyStatus;
//
//   const PharmacyEntity({required this.pharmaId, required this.pharmaName, required this.pharmaAddress, required this.pharmaLocation, required this.pharmaPhone, required this.pharmaEmail, required this.pharmaPassword, required this.pharmaConfirmPassword, required this.pharmaLicense, required this.pharmaOpenTime, required this.pharmaCloseTime, required this.pharmaImage, required this.pharmacyStatus});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [pharmaId, pharmaName, pharmaAddress, pharmaLocation, pharmaPhone, pharmaEmail, pharmaPassword, pharmaConfirmPassword, pharmaLicense, pharmaOpenTime, pharmaCloseTime, pharmaImage, pharmacyStatus];
// }
//
// class MedicinesEntity extends Equatable{
//   final int medId;
//   final String medName;
//   final String medType;
//   final String medPrice;
//   final String medImage;
//   final String medDescription;
//   final String distanceFromUser;
//   final int rates;
//   final int reviews;
//   final bool availability;
//   final PharmacyEntity pharmacy;
//   const  MedicinesEntity({required this.medId, required this.medName, required this.medType, required this.medPrice, required this.medImage, required this.medDescription, required this.distanceFromUser, required this.rates, required this.reviews, this.availability =true, required this.pharmacy, Object? description, Object? id});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [medId, medName, medType, medPrice, medImage, medDescription, distanceFromUser, rates, reviews, availability, pharmacy];
//
//
// }
//
//
// class UsersAccountEntity extends Equatable{
//   final int userId;
//   final String userName;
//   final String userEmail;
//   final String userPhone;
//   final String userPassword;
//   final String userConfirmPassword;
//   final String userImage;
//
//
//   const UsersAccountEntity({required this.userId, required this.userName, required this.userEmail, required this.userPhone, required this.userPassword, required this.userConfirmPassword,required this.userImage, });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [userId, userName, userEmail, userPhone, userPassword, userConfirmPassword];
// }
//
// // class SystemManageEntity extends Equatable{
// //  final int system_id;
// //  final List<PharmacyEntity> pharmacies;
// //  final List<MedicinesEntity> medicines;
// //  final List<UsersAccountEntity> users;
// //
// // }
//
//
// class PharmaciesRequestEntity extends Equatable{
//   final int requestId;
//   final PharmacyEntity pharmacy;
//   final String requestMessage;
//   final String requestDate;
//
//   const PharmaciesRequestEntity({required this.requestId, required this.pharmacy, required this.requestMessage, required this.requestDate});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [requestId, pharmacy, requestMessage, requestDate];
//
// }