
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationInitializationController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initPlatformState();
    checkSubscriptionStatus();

  }

  Future<bool> checkSubscriptionStatus() async {

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 3));
    // Get the current subscription status
    final isSubscribed = OneSignal.User.pushSubscription.optedIn;
    print("isSubscribed: $isSubscribed");

    var playerId = OneSignal.User.pushSubscription.id;

    print("playerId: $playerId"); //THIS IS USED FOR APP SEND NOTIFICATION

    // Check if the user is subscribed
    if (isSubscribed != null && isSubscribed) {
      // Save an String value to 'action' key.
      await prefs.setString('playerId', playerId.toString());

      print("User is_subscribed");
      return true; // User is subscribed
    } else {
      print("User is not_subscribed");
      return false; // User is not subscribed
    }
  }

  Future<void> initPlatformState() async {

    // 1. Initialize OneSignal
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose); // Optional debugging
    try {
      await dotenv.load(fileName: ".env");
      final onesignalApiKey =  dotenv.get(
          'ONESIGNAL_APP_ID', fallback: "Missed_ONESIGNAL_APP_ID");

      print('onesignalApiKey: $onesignalApiKey}');
      OneSignal.initialize(onesignalApiKey.toString());
    } catch(e){
      print('onesignalApiKey_Error :$e');
    }

    // 2. Request permission (Optional: do this where appropriate in your UX)
    OneSignal.Notifications.requestPermission(true);

    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has_permission " + state.toString());
    });

    // Get device state
    final deviceState = await OneSignal.User.getOnesignalId();
    debugPrint("Device_ID: $deviceState");

  }
}