

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserDetails() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final userId = await prefs.getString('userId');
  return userId;
}