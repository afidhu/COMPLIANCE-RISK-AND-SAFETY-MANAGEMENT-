import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<Widget?> searchedDetails({

  required String title,
  required String type,

}) async {

  return await Get.bottomSheet(

    isScrollControlled: true,

    backgroundColor: Colors.white,

    Container(

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

      child: Column(

        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          /// TOP BAR
          Center(
            child: Container(
              width: 60,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// TITLE
          Text(

            title,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0000BA),
            ),
          ),

          const SizedBox(height: 12),

          /// TYPE
          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),

            decoration: BoxDecoration(

              color: const Color(0x140000BA),

              borderRadius: BorderRadius.circular(12),
            ),

            child: Text(

              type,

              style: const TextStyle(
                color: Color(0xFF0000BA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "$title belongs to $type module in the Facilities Compliance Management System.",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}