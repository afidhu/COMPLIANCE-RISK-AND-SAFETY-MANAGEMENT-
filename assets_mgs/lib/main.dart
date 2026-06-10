import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'core/screens/splash_screen.dart';
import 'features/hazards/data/data_sources/remote_hazard_data_source.dart';
import 'features/hazards/data/repo_impl/hazard_repo_impl.dart';
import 'features/hazards/domain/repository/hazard_repo.dart';
import 'features/hazards/domain/use_cases/get_hazards_case.dart';
import 'features/hazards/presentation/bloc/hazards_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MultiRepositoryProvider(providers: [
    RepositoryProvider<HazardRepo>(create: (_)=>HazardRepoImpl(RemoteHazardDataSource()) ),

     ],

      child: MultiBlocProvider(providers: [
        BlocProvider<HazardsBloc>(create: (context)=>HazardsBloc(GetHazardsCase(context.read<HazardRepo>()) )),

      ],
          child: ScreenUtilInit(
            designSize: const Size(249, 419),
            child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Project',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                ),
                // home: HomeBottomNav()
                home: SplashScreen()
            ),
          )
      )
  ) );
}







//
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  ScreenUtilInit(
//         designSize: const Size(360, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//       builder: (context,_) {
//         return GetMaterialApp(
//           title: 'Flutter Demo',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             // This is the theme of your application.
//             //
//             // TRY THIS: Try running your application with "flutter run". You'll see
//             // the application has a purple toolbar. Then, without quitting the app,
//             // try changing the seedColor in the colorScheme below to Colors.green
//             // and then invoke "hot reload" (save your changes or press the "hot
//             // reload" button in a Flutter-supported IDE, or press "r" if you used
//             // the command line to start the app).
//             //
//             // Notice that the counter didn't reset back to zero; the application
//             // state is not lost during the reload. To reset the state, use hot
//             // restart instead.
//             //
//             // This works for code too, not just values: Most code changes can be
//             // tested with just a hot reload.
//             colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//           ),
//           // home: HomeBottomNav()
//           home: LoginScreen(),
//           // home: SplashScreen(),
//           // home: InspectionScreen(),
//           // home: Hazards(),
//           // home: AssetScreen(),
//           // home: RiskScreen(),
//         );
//       }
//     );
//   }
// }
