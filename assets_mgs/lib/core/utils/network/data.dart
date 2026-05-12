

import 'model_fake.dart';

final List<PharmacyEntity> pharmacies = [
  PharmacyEntity(
    pharmaId: 1,
    pharmaName: "City Care Pharmacy",
    pharmaAddress: "Makumbusho Street",
    pharmaLocation: "Dar es Salaam",
    pharmaPhone: "+255712345001",
    pharmaEmail: "citycare@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-001",
    pharmaOpenTime: "08:00",
    pharmaCloseTime: "22:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),

  PharmacyEntity(
    pharmaId: 2,
    pharmaName: "Afya Plus Pharmacy",
    pharmaAddress: "Sokoine Road",
    pharmaLocation: "Morogoro",
    pharmaPhone: "+255712345002",
    pharmaEmail: "afyaplus@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-002",
    pharmaOpenTime: "07:30",
    pharmaCloseTime: "21:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6",
    pharmacyStatus: PharmacyApprovedStatus.pending,
  ),

  PharmacyEntity(
    pharmaId: 3,
    pharmaName: "MediLife Pharmacy",
    pharmaAddress: "Kariakoo",
    pharmaLocation: "Dar es Salaam",
    pharmaPhone: "+255712345003",
    pharmaEmail: "medilife@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-003",
    pharmaOpenTime: "08:00",
    pharmaCloseTime: "20:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1523217582562-09d0def993a6",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),

  PharmacyEntity(
    pharmaId: 4,
    pharmaName: "Green Cross Pharmacy",
    pharmaAddress: "Uhuru Street",
    pharmaLocation: "Arusha",
    pharmaPhone: "+255712345004",
    pharmaEmail: "greencross@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-004",
    pharmaOpenTime: "09:00",
    pharmaCloseTime: "23:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
    pharmacyStatus: PharmacyApprovedStatus.rejected,
  ),

  PharmacyEntity(
    pharmaId: 5,
    pharmaName: "Health Hub Pharmacy",
    pharmaAddress: "Mwenge",
    pharmaLocation: "Dar es Salaam",
    pharmaPhone: "+255712345005",
    pharmaEmail: "healthhub@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-005",
    pharmaOpenTime: "08:00",
    pharmaCloseTime: "22:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1572120360610-d971b9d7767c",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),

  PharmacyEntity(
    pharmaId: 6,
    pharmaName: "Salama Pharmacy",
    pharmaAddress: "Nyerere Road",
    pharmaLocation: "Dodoma",
    pharmaPhone: "+255712345006",
    pharmaEmail: "salama@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-006",
    pharmaOpenTime: "07:00",
    pharmaCloseTime: "19:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1501183638710-841dd1904471",
    pharmacyStatus: PharmacyApprovedStatus.pending,
  ),

  PharmacyEntity(
    pharmaId: 7,
    pharmaName: "Hope Pharmacy",
    pharmaAddress: "Posta Mpya",
    pharmaLocation: "Mwanza",
    pharmaPhone: "+255712345007",
    pharmaEmail: "hope@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-007",
    pharmaOpenTime: "08:00",
    pharmaCloseTime: "21:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1592595896616-c37162298647",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),

  PharmacyEntity(
    pharmaId: 8,
    pharmaName: "LifeCare Pharmacy",
    pharmaAddress: "Buguruni",
    pharmaLocation: "Dar es Salaam",
    pharmaPhone: "+255712345008",
    pharmaEmail: "lifecare@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-008",
    pharmaOpenTime: "09:00",
    pharmaCloseTime: "22:30",
    pharmaImage:
    "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c",
    pharmacyStatus: PharmacyApprovedStatus.pending,
  ),

  PharmacyEntity(
    pharmaId: 9,
    pharmaName: "Unity Pharmacy",
    pharmaAddress: "Kilimani",
    pharmaLocation: "Mbeya",
    pharmaPhone: "+255712345009",
    pharmaEmail: "unity@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-009",
    pharmaOpenTime: "08:00",
    pharmaCloseTime: "20:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1600585154526-990dced4db0d",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),

  PharmacyEntity(
    pharmaId: 10,
    pharmaName: "Wellness Pharmacy",
    pharmaAddress: "Mbezi Beach",
    pharmaLocation: "Dar es Salaam",
    pharmaPhone: "+255712345010",
    pharmaEmail: "wellness@gmail.com",
    pharmaPassword: "password123",
    pharmaConfirmPassword: "password123",
    pharmaLicense: "LIC-010",
    pharmaOpenTime: "10:00",
    pharmaCloseTime: "00:00",
    pharmaImage:
    "https://images.unsplash.com/photo-1600585154084-4e5fe7c39198",
    pharmacyStatus: PharmacyApprovedStatus.approved,
  ),
];


final List<MedicinesEntity> medicines = [
  MedicinesEntity(
    medId: 1,
    medName: "Paracetamol",
    medType: "Tablet",
    medPrice: "2000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1628771065518-0d82f1938462",
    medDescription: "Used to relieve pain and reduce fever.",
    distanceFromUser: "1.2 km",
    rates: 5,
    reviews: 120,
    availability: true,
    pharmacy: pharmacies[0],
  ),

  MedicinesEntity(
    medId: 2,
    medName: "Amoxicillin",
    medType: "Capsule",
    medPrice: "5000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1588776814546-1ffcf47267a5",
    medDescription: "Antibiotic for bacterial infections.",
    distanceFromUser: "2.5 km",
    rates: 4,
    reviews: 85,
    availability: true,
    pharmacy: pharmacies[1],
  ),

  MedicinesEntity(
    medId: 3,
    medName: "Cough Syrup",
    medType: "Syrup",
    medPrice: "4500 TZS",
    medImage:
    "https://images.unsplash.com/photo-1603398938378-e54eab446dde",
    medDescription: "Relieves cough and sore throat.",
    distanceFromUser: "0.8 km",
    rates: 4,
    reviews: 60,
    availability: true,
    pharmacy: pharmacies[2],
  ),

  MedicinesEntity(
    medId: 4,
    medName: "Ibuprofen",
    medType: "Tablet",
    medPrice: "3000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae",
    medDescription: "Anti-inflammatory pain relief.",
    distanceFromUser: "3.1 km",
    rates: 5,
    reviews: 140,
    availability: true,
    pharmacy: pharmacies[3],
  ),

  MedicinesEntity(
    medId: 5,
    medName: "Vitamin C",
    medType: "Tablet",
    medPrice: "2500 TZS",
    medImage:
    "https://images.unsplash.com/photo-1580281657527-47d5c9a2f50d",
    medDescription: "Boosts immunity.",
    distanceFromUser: "1.7 km",
    rates: 4,
    reviews: 95,
    availability: true,
    pharmacy: pharmacies[4],
  ),

  MedicinesEntity(
    medId: 6,
    medName: "Insulin",
    medType: "Injection",
    medPrice: "25000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1588774069160-8c3e3c7b0c02",
    medDescription: "Controls blood sugar levels.",
    distanceFromUser: "4.0 km",
    rates: 5,
    reviews: 70,
    availability: false,
    pharmacy: pharmacies[5],
  ),

  MedicinesEntity(
    medId: 7,
    medName: "Antacid",
    medType: "Tablet",
    medPrice: "1800 TZS",
    medImage:
    "https://images.unsplash.com/photo-1602052793312-b99c2a9ee797",
    medDescription: "Relieves acid reflux.",
    distanceFromUser: "2.0 km",
    rates: 3,
    reviews: 40,
    availability: true,
    pharmacy: pharmacies[6],
  ),

  MedicinesEntity(
    medId: 8,
    medName: "Eye Drops",
    medType: "Drops",
    medPrice: "6000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1612531385446-f7e6d131e1d7",
    medDescription: "Treats eye irritation.",
    distanceFromUser: "1.0 km",
    rates: 4,
    reviews: 55,
    availability: true,
    pharmacy: pharmacies[7],
  ),

  MedicinesEntity(
    medId: 9,
    medName: "Blood Pressure Medicine",
    medType: "Tablet",
    medPrice: "8000 TZS",
    medImage:
    "https://images.unsplash.com/photo-1607619056625-6b65b2c7bfcf",
    medDescription: "Manages hypertension.",
    distanceFromUser: "3.6 km",
    rates: 5,
    reviews: 110,
    availability: true,
    pharmacy: pharmacies[8],
  ),

  MedicinesEntity(
    medId: 10,
    medName: "Allergy Relief",
    medType: "Tablet",
    medPrice: "3500 TZS",
    medImage:
    "https://images.unsplash.com/photo-1613918108466-292b78a8ef95",
    medDescription: "Reduces allergy symptoms.",
    distanceFromUser: "0.5 km",
    rates: 4,
    reviews: 75,
    availability: true,
    pharmacy: pharmacies[9],
  ),
];


final List<UsersAccountEntity> userList = [
  UsersAccountEntity(
    userId: 1,
    userName: "Juma Hassan",
    userEmail: "juma@gmail.com",
    userPhone: "+255712111001",
    userPassword: "password123",
    userConfirmPassword: "password123",
    userImage:
    "https://randomuser.me/api/portraits/men/32.jpg",
  ),

  UsersAccountEntity(
    userId: 2,
    userName: "Asha Mohamed",
    userEmail: "asha@gmail.com",
    userPhone: "+255712111002",
    userPassword: "password123",
    userConfirmPassword: "password123",
    userImage:
    "https://randomuser.me/api/portraits/women/44.jpg",
  ),

  UsersAccountEntity(
    userId: 3,
    userName: "Alex Joseph",
    userEmail: "alex@gmail.com",
    userPhone: "+255712111003",
    userPassword: "password123",
    userConfirmPassword: "password123",
    userImage:
    "https://randomuser.me/api/portraits/men/75.jpg",
  ),

  UsersAccountEntity(
    userId: 4,
    userName: "Neema John",
    userEmail: "neema@gmail.com",
    userPhone: "+255712111004",
    userPassword: "password123",
    userConfirmPassword: "password123",
    userImage:
    "https://randomuser.me/api/portraits/women/68.jpg",
  ),

  UsersAccountEntity(
    userId: 5,
    userName: "Brian Luka",
    userEmail: "brian@gmail.com",
    userPhone: "+255712111005",
    userPassword: "password123",
    userConfirmPassword: "password123",
    userImage:
    "https://randomuser.me/api/portraits/men/18.jpg",
  ),
];
