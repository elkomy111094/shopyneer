import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopyneer/core/app_bloc_observer.dart';
import 'package:shopyneer/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:shopyneer/core/widgets/parent_widget.dart';
import 'package:shopyneer/features/Auth/model/auth_model.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/mainLayout/main_layout.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_bloc.dart';
import 'package:size_config/size_config.dart';

import 'config/app_config.dart';
import 'config/navigation/nav.dart';
import 'config/navigation/nav_obs.dart';
import 'core/app/app_bloc.dart';
import 'core/getit_service/getit_service.dart';

int _lastVersion = 4;
// PackageInfo? packageInfo;
String? token; // for
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  //todo remove at production
  final prefs = await SharedPreferences.getInstance();
  final savedVersion = prefs.getInt('saved_version') ?? 0;
  if (_lastVersion != savedVersion) {
    await prefs.clear();
    await prefs.setInt('saved_version', _lastVersion);
    await HydratedBloc.storage.clear();
  }
  await EasyLocalization.ensureInitialized();

  await _getUserData(prefs);

  // call checkInitialConnectivity before runApp to check internet connection
  await getIt<ConnectivityCubit>().checkInitialConnectivity();

  /// is used to observer the app bloc events and states for debugging purposes
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

_getUserData(SharedPreferences prefs) async {
  final user = prefs.get(kUserKey);

  if (user != null && user is Map<String, dynamic>) {
    final AuthModel userModel = AuthModel.fromJson(user);
    AppBloc().loggedIn(userModel.userData);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => getIt.get<HomeCubit>()..getGeneralProducts(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        path: 'assets/langs',
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        child: SizeConfigInit(
          referenceHeight: 926,
          referenceWidth: 428,
          builder: (context, orientation) => MaterialApp(
            title: 'Shopyneer',
            debugShowCheckedModeBanner: false,
            navigatorKey: Nav.mainNavKey,
            navigatorObservers: [NavObs('MAIN')],
            localizationsDelegates: [
              CountryLocalizations.delegate,
              ...context.localizationDelegates
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const ParentWidget(child: MainLayoutPage()),
          ),
        ),
      ),
    );
  }
}
