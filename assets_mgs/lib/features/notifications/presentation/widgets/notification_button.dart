import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../screens/notifications.dart';

Widget notificationButton() {
  return IconButton(
    onPressed: () {
      Get.to(() => Notifications());
    },
    icon: Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.notifications_active_rounded,
          color: Colors.white,
          size: 30,
        ),

        Positioned(
          right: -4,
          top: -4,
          child: IgnorePointer(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: const Text(
                "12",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}