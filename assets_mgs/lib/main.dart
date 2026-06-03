import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/screens/home_bottom_nav.dart';
import 'core/screens/splash_screen.dart';
import 'features/assets/presentation/screens/asset_screen.dart';
import 'features/auths/presentation/screens/login.dart';
import 'features/hazards/presentation/screens/hazards.dart';
import 'features/inspections/presentation/screens/inspensions.dart';
import 'features/risks/presentation/screens/Risk_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,_) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          // home: HomeBottomNav()
          home: LoginScreen(),
          // home: SplashScreen(),
          // home: InspectionScreen(),
          // home: Hazards(),
          // home: AssetScreen(),
          // home: RiskScreen(),
        );
      }
    );
  }
}
