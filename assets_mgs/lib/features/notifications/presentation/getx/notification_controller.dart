
import 'package:assets_mgs/features/auths/presentation/screens/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../bloc/notification_bloc.dart';
import '../screens/notifications_screen.dart';



class NotificationController  extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    notificationViewClickHandle();

  }

 Future<void>  notificationViewClickHandle() async{
    // 3. Register the notification click listener
    OneSignal.Notifications.addClickListener((event) {
      print('NOTIFICATION_CLICKED: ${event.notification.jsonRepresentation()}');

      // Extract custom payload data
      final Map<String, dynamic>? additionalData = event.notification.additionalData;

      if (additionalData != null) {
        // Example: Route based on custom data payload
        // final String? targetScreen = additionalData['route'];
        final String? notificationType = additionalData['type'];
        final String? itemReferenceId = additionalData['referenceId'];

        print('itemId_:$itemReferenceId');
        print('notificationType:$notificationType');
        if (notificationType == 'CAPA') {
          print('Get.context: ${Get.context}');
          if(Get.context != null){
            // write bloc f() call here by pass userId, data will to next page
            Get.context!.read<NotificationBloc>().add(GetNotificationByUserEvent());
            // Trigger your navigation logic here (e.g., Navigator, GoRouter)
            print('Navigate to $notificationType with ID: $itemReferenceId');

            // 1. Wipe out everything and open the Login screen first
              Get.offAll(() => LoginScreen());
              // 2. Instantly slide the Notifications screen over the login page
            Get.to(() => NotificationsScreen());

          }
        }
        else if(notificationType == 'COMPLIANCE') {
            print('Get.context: ${Get.context}');
            if(Get.context != null){
              // write bloc f() call here by pass userId, data will to next page
              Get.context!.read<NotificationBloc>().add(GetNotificationByUserEvent());
              // Trigger your navigation logic here (e.g., Navigator, GoRouter)
              print('Navigate to $notificationType with ID: $itemReferenceId');

              // 1. Wipe out everything and open the Login screen first
              Get.offAll(() => LoginScreen());
              // 2. Instantly slide the Notifications screen over the login page
              Get.to(() => NotificationsScreen());
            }
          }
      }
    });
  }
}
