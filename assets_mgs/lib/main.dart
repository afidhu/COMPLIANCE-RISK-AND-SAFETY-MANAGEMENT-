
import 'package:assets_mgs/features/assets/domain/use_cases/get_assets_case.dart';
import 'package:assets_mgs/features/mitigations/data/repo_impl/mitigation_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/screens/splash_screen.dart';
import 'features/CAPA/data/data_sources/remote_capa_data_remote.dart';
import 'features/CAPA/data/repo_impl/capa_repo_impl.dart';
import 'features/CAPA/domain/repository/capa_repo.dart';
import 'features/CAPA/domain/use_cases/get_capa_by_technician.dart';
import 'features/CAPA/domain/use_cases/get_capa_case.dart';
import 'features/CAPA/domain/use_cases/update_capa_technician.dart';
import 'features/CAPA/presentation/bloc/capa_bloc.dart';
import 'features/Incidents/data/data_sources/incident_remote_data.dart';
import 'features/Incidents/data/repo_impl/incident_repo_impl.dart';
import 'features/Incidents/domain/repository/incident_repo.dart';
import 'features/Incidents/domain/use_cases/get_incident_case.dart';
import 'features/Incidents/presentation/bloc/incident_bloc.dart';
import 'features/assets/data/data_sources/asset_remote_data.dart';
import 'features/assets/data/repo_impl/assets_repo_impl.dart';
import 'features/assets/domain/repository/assets_repo.dart';
import 'features/assets/presentation/bloc/assets_bloc.dart';
import 'features/auths/data/data_sources/auth_remote_data.dart';
import 'features/auths/data/repo_impl/auth_repo_impl.dart';
import 'features/auths/domain/repository/auth_repo.dart';
import 'features/auths/domain/use_cases/login_case.dart';
import 'features/auths/domain/use_cases/register_case.dart';
import 'features/auths/presentation/bloc/auth_bloc.dart';
import 'features/auths/presentation/cubit/auth_cubit.dart';
import 'features/compliances/data/data_sources/compliance_remote_data_source.dart';
import 'features/compliances/data/repo_impl/compliance_repo_impl.dart';
import 'features/compliances/domain/repository/compliance_repo.dart';
import 'features/compliances/domain/use_cases/get_compliance_case.dart';
import 'features/compliances/domain/use_cases/update_compliance_case.dart';
import 'features/compliances/presentation/bloc/compliance_bloc.dart';
import 'features/hazards/data/data_sources/remote_hazard_data_source.dart';
import 'features/hazards/data/repo_impl/hazard_repo_impl.dart';
import 'features/hazards/domain/repository/hazard_repo.dart';
import 'features/hazards/domain/use_cases/add_hazards_case.dart';
import 'features/hazards/domain/use_cases/get_hazards_case.dart';
import 'features/hazards/presentation/bloc/hazards_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/mitigations/data/data_sources/mitigation_remote_data.dart';
import 'features/mitigations/domain/repository/mitigation_repo.dart';
import 'features/mitigations/domain/use_cases/get_mitigation_case.dart';
import 'features/mitigations/presentation/bloc/mitigation_bloc.dart';
import 'features/notifications/data/data_sources/notification_remote_data.dart';
import 'features/notifications/data/repo_impl/notification_repo_impl.dart';
import 'features/notifications/domain/repository/notification_repo.dart';
import 'features/notifications/domain/use_cases/get_user_notification_case.dart';
import 'features/notifications/domain/use_cases/update_notification_as_read_case.dart';
import 'features/notifications/presentation/bloc/notification_bloc.dart';

import 'features/notifications/presentation/getx/notification_initialization.dart';
import 'features/risks/data/data_sources/risk_remote_data.dart';
import 'features/risks/data/repo_impl/risk_repo_impl.dart';
import 'features/risks/domain/repository/risk_repo.dart';
import 'features/risks/domain/use_cases/add_risk_case.dart';
import 'features/risks/domain/use_cases/get_all_risk_case.dart';
import 'features/risks/domain/use_cases/get_risk_case.dart';
import 'features/risks/presentation/bloc/risks_bloc.dart';
import 'features/searchings/data/data_sources/search_remote_data.dart';
import 'features/searchings/data/repo_impl/search_repo_impl.dart';
import 'features/searchings/domain/repository/search_repo.dart';
import 'features/searchings/domain/use_cases/get_search_case.dart';
import 'features/searchings/presentation/cubit/search_cubit.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  //Notification initialization by onesignal
  Get.put(NotificationInitializationController());

  //Called function that work when user click notification message
  // Get.put(NotificationController());

  runApp(

    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HazardRepo>(
          create: (_) => HazardRepoImpl(RemoteHazardDataSource()),
        ),
        RepositoryProvider<AssetsRepo>(
          create: (_) => AssetsRepoImpl(RemoteAssetsDataSource()),
        ),
        RepositoryProvider<ComplianceRepo>(
          create: (_) => ComplianceRepoImpl(ComplianceRemoteDataSource()),
        ),
        RepositoryProvider<RiskRepo>(
          create: (_) => RiskRepoImpl(RiskRemoteData()),
        ),
        RepositoryProvider<CapaRepo>(
          create: (_) => CapaRepoImpl(RemoteCapaDataRemote()),
        ),
        RepositoryProvider<MitigationRepo>(
          create: (_) => MitigationRepoImpl(MitigationRemoteData()),
        ),
        RepositoryProvider<IncidentRepo>(
          create: (_) => IncidentRepoImpl(IncidentRemoteData()),
        ),
        RepositoryProvider<AuthRepo>(
          create: (_) => AuthRepoImpl(AuthRemoteData()),
        ),

        RepositoryProvider<NotificationRepo>(
          create: (_) => NotificationRepoImpl(NotificationRemoteData()),
        ),

        RepositoryProvider<SearchRepo>(
          create: (_) => SearchRepoImpl(SearchRemoteData()),
        ),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider<HazardsBloc>(
            create: (context) => HazardsBloc(
              GetHazardsCase(context.read<HazardRepo>()),
              AddHazardsCase(context.read<HazardRepo>()),
            ),
          ),
          BlocProvider<AssetsBloc>(
            create: (context) =>
                AssetsBloc(GetAssetsCase(context.read<AssetsRepo>())),
          ),
          BlocProvider<ComplianceBloc>(
            create: (context) => ComplianceBloc(
              GetComplianceCase(context.read<ComplianceRepo>()),
              UpdateComplianceCase(context.read<ComplianceRepo>()),
            ),
          ),
          BlocProvider<RisksBloc>(
            create: (context) => RisksBloc(
              GetRiskCase(context.read<RiskRepo>()),
              GetAllRiskCase(context.read<RiskRepo>()),
              AddRiskCase(context.read<RiskRepo>()),
            ),
          ),
          BlocProvider<CapaBloc>(
            create: (context) => CapaBloc(
              GetCapaCase(context.read<CapaRepo>()),
              GetCapaByTechnician((context.read<CapaRepo>())),
              UpdateCapaTechnicianCase((context.read<CapaRepo>())),
            ),
          ),
          BlocProvider<MitigationBloc>(
            create: (context) => MitigationBloc(
              GetMitigationCase(context.read<MitigationRepo>()),
            ),
          ),
          BlocProvider<IncidentBloc>(
            create: (context) =>
                IncidentBloc(GetIncidentCase(context.read<IncidentRepo>())),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(LoginCase(context.read<AuthRepo>()),RegisterCase(context.read<AuthRepo>())),
          ),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit()),

          BlocProvider<NotificationBloc>(
            create: (context) => NotificationBloc(GetUserNotificationCase(context.read<NotificationRepo>()),UpdateNotificationAsReadCase(context.read<NotificationRepo>())),
          ),

          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit(GetSearchCase(context.read<SearchRepo>())),
          ),
        ],

        child: ScreenUtilInit(
          designSize: const Size(249, 419),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Project',
            // theme: AppTheme.dark,
            themeMode: ThemeMode.system,
              // theme: AppTheme.light,
              // darkTheme: AppTheme.dark,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            // home: HomeBottomNav()
            home: SplashScreen()
            // home: LoginScreen(),
            // home: RegisterScreen(),
          ),
        ),
      ),
    ),

  );
}
