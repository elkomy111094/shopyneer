import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopyneer/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/features/Auth/login/login_bloc/login_bloc.dart';
import 'package:shopyneer/features/Auth/otp/otp_bloc/otp_bloc.dart';
import 'package:shopyneer/features/Auth/register/register_bloc/register_bloc.dart';
import 'package:shopyneer/features/contracts/cubit/contracts_cubit.dart';
import 'package:shopyneer/features/contracts/repo/contracts_repo.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/home/repo/home_repo.dart';
import 'package:shopyneer/features/profile/repo/profile_repo.dart';
import 'package:shopyneer/features/visits/cubit/visits_cubit.dart';
import 'package:shopyneer/features/visits/repo/visits_repo.dart';

import '../../config/localization/lang_repo.dart';
import '../../features/Auth/repo/auth_repo.dart';
import '../../features/profile/profile_bloc/profile_bloc.dart';
import '../../features/splash/bloc/splash_bloc.dart';
import '../cache/cache_helper.dart';
import '../utils/notifications/setup_notifications.dart';

final getIt = GetIt.I;

Future initializeDependencies() async {
  getIt.registerLazySingleton<ApiHandler>(
    () => ApiHandler(),
  );
  //shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(sharedPreferences);
  // cache
  getIt.registerSingleton(
    CacheHelper(sharedPreferences),
  );

  // notificationsFCM
  getIt.registerLazySingleton<SetupFCM>(
    () => SetupFCM(
      langRepo: getIt(),
      cacheHelper: getIt(),
    ),
  );

  getIt.registerSingleton(
    LangRepo(),
  );

  getIt.registerFactory(
    () => RegisterBloc(),
  );

  getIt.registerFactory(
    () => OtpBloc(),
  );
  //
  getIt.registerFactory(
    () => SplashBloc(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => LoginBloc(),
  );
  getIt.registerLazySingleton(
    () => ProfileBloc(),
  );

  getIt.registerFactory(
    () => ContractsCubit(),
  );
  getIt.registerLazySingleton(
    () => ProfileRepo(),
  );

  getIt.registerLazySingleton(
    () => ContractsRepo(),
  );

  getIt.registerFactory(
    () => VisitsCubit(),
  );

  getIt.registerLazySingleton(
    () => VisitsRepo(),
  );

  getIt.registerLazySingleton(
    () => HomeCubit(),
  );

  getIt.registerFactory(
    () => ConnectivityCubit(),
  );

  getIt.registerLazySingleton(
    () => HomeRepo(),
  );
  //repos
  getIt.registerSingleton(
    AuthRepo(),
  );

  // create one instance from logger with prevent such logs from appearing in the release version of your app
  getIt.registerLazySingleton<Logger>(() => Logger(
        level: kReleaseMode
            ? Level.off
            : Level.debug, // Disable logs in release mode
      ));
}

/// one instance from Logger class shared in the app
final logger = getIt.get<Logger>();
