
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/notification_bloc.dart';
import 'notification_controller.dart';

class NotificationInitializationController extends GetxController {

  NotificationController notificationController =Get.put(NotificationController());
  @override
  void onInit() {
    super.onInit();
    // Start the sequential boot chain
    bootNotificationSystem();
  }

  // New master method to enforce strict order
  Future<void> bootNotificationSystem() async {
    await initPlatformState();         // 1. Initialize SDK
    notificationController.notificationViewClickHandle();// 2. Attach Click Observer Immediately
    await checkSubscriptionStatus();   // 3. Check / Update Device ID
  }

  Future<void> initPlatformState() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    try {
      await dotenv.load(fileName: ".env");
      final onesignalApiKey = dotenv.get('ONESIGNAL_APP_ID', fallback: "Missed_ONESIGNAL_APP_ID");

      print('onesignalApiKey: $onesignalApiKey');
      OneSignal.initialize(onesignalApiKey.toString());
    } catch(e) {
      print('onesignalApiKey_Error :$e');
    }

    // CRITICAL: Await the permission prompt so the user has a chance to accept
    // before you check for their pushSubscription token.
    await OneSignal.Notifications.requestPermission(true);

    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has_permission " + state.toString());
      // Pro-tip: If permission changes late, re-check status here
      checkSubscriptionStatus();
    });

    final deviceState = await OneSignal.User.getOnesignalId();
    debugPrint("Device_ID: $deviceState");
  }

  Future<bool> checkSubscriptionStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Give OneSignal a brief moment to register the token locally after permission approval
    await Future.delayed(Duration(seconds: 2));

    final isSubscribed = OneSignal.User.pushSubscription.optedIn;
    print("isSubscribed: $isSubscribed");

    var playerId = OneSignal.User.pushSubscription.id;
    print("playerId: $playerId");

    // Ensure playerId is not null before saving to SharedPreferences
    if (isSubscribed == true && playerId != null) {
      await prefs.setString('playerId', playerId);
      print("User is_subscribed and ID saved.");
      return true;
    } else {
      print("User is not_subscribed or PlayerID is still fetching.");
      return false;
    }
  }
}
