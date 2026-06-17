

import 'package:intl/intl.dart';



String dateFormater(String date){
  // 1. Parse the ISO string to a DateTime object
  DateTime parsedDate = DateTime.parse(date);

// 2. Format it to a normal reading style
  String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);
// Output example: June 18, 2026
  return formattedDate;
}
// // class DateFormater {
// //
// // 1. Parse the ISO string to a DateTime object
//   DateTime parsedDate = DateTime.parse(compliance.dueDate);
//
// // 2. Format it to a normal reading style
//   String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);
// // Output example: June 18, 2026
// //
// // }
