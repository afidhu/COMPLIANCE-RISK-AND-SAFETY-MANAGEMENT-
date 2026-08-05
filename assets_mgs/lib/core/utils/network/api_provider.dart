

class ApiProvider {
  // static const String baseUrl = 'http://10.0.2.2:51213';
  static const String baseUrl = 'http://192.168.1.14:51213';
  // https://fdx5tc34-51213.inc1.devtunnels.ms/
  // static const String baseUrl = 'https://fdx5tc34-51213.inc1.devtunnels.ms';
  static const String allMedicines = '$baseUrl/medicines/all';
  static const String addMedicines = '$baseUrl/medicines/add';

  static const String allPharmacy = '$baseUrl/pharmacy/all';
  static const String addPharmacy = '$baseUrl/pharmacy/add';

  static const String getMedicineForPharmacy = '$baseUrl/pharmacy/medicine-pharmacy';
  static const String addMedicineForPharmacy = '$baseUrl/pharmacy/medicine-pharmacy';

  static const String addPharmacyRequest ='$baseUrl/pharmacy-requests/add';
  static const String allPharmaciesRequest = '$baseUrl/pharmacy-requests/get';
}
