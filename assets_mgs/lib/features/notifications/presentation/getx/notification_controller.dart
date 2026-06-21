
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';



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
          // Trigger your navigation logic here (e.g., Navigator, GoRouter)
          print('Navigate to $notificationType with ID: $itemReferenceId');

          // write bloc f() call here by pass userId, data will to next page
        }
      }
    });
  }
}
