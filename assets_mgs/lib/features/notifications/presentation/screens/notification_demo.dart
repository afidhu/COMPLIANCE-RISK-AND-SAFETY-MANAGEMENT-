import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key});

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {


  @override
  void initState() {
    super.initState();
    initPlatformState();
    checkSubscriptionStatus();
  }
  Future<bool> checkSubscriptionStatus() async {
    await Future.delayed(Duration(seconds: 3));
    // Get the current subscription status
    final isSubscribed = OneSignal.User.pushSubscription.optedIn;
    print("isSubscribed: $isSubscribed");

    var playerId = OneSignal.User.pushSubscription.id;

    print("playerId: $playerId"); //THIS IS USED FOR APP SEND NOTIFICATION

    // Check if the user is subscribed
    if (isSubscribed != null && isSubscribed) {
      print("User is_subscribed");
      return true; // User is subscribed
    } else {
      print("User is not_subscribed");
      return false; // User is not subscribed
    }
  }

  Future<void> initPlatformState() async {
    // Set your OneSignal App ID here

    // ✅ Ensure Flutter engine bindings are initialized
    WidgetsFlutterBinding.ensureInitialized();

    // ✅ Enable verbose logging for debugging (remove in production)
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // ✅ Initialize with your OneSignal App ID
    OneSignal.initialize("bc7ed886-b96c-44f1-a003-255e1e21a974");

    // ✅ Request notification permission (especially for iOS)
    OneSignal.Notifications.requestPermission(true);

    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has_permission " + state.toString());
    });

    // Get device state
    final deviceState = await OneSignal.User.getOnesignalId();
    debugPrint("Device_ID: $deviceState");


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
