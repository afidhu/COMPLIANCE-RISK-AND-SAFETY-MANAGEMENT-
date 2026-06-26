import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../bloc/notification_bloc.dart';
import '../screens/notifications_screen.dart';

Widget notificationButton() {
 Get.context?.read<NotificationBloc>().add(GetNotificationByUserEvent());
  return IconButton(
    onPressed: () {
      Get.to(() => NotificationsScreen());
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
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                 if(state is NotificationLoaded){
                   final unRead = state.notification.where((item)=>item.isRead==false).length;
                   return  Text(
                     unRead.toString(),
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 10,
                       fontWeight: FontWeight.bold,
                     ),
                   );
                 }
                 return SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}