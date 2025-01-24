import 'dart:async';
import 'dart:developer';

import '../../../config/app_config.dart';
import '../../models/user_model.dart';
import '../../../config/localization/lang_repo.dart';
import '../../cache/cache_helper.dart';
import '../../getit_service/getit_service.dart';
import '../debouncer.dart';
import '../vaildData/valid_data.dart';
import 'supports_firebase.dart';

typedef SilentNotificationHandler = void Function(Map<String, dynamic> data);

class SetupFCM {
  SetupFCM({
    required this.langRepo,
    required this.cacheHelper,
  });

  static SetupFCM get i => getIt();

  final Debouncer _debouncer = Debouncer();

  final CacheHelper cacheHelper;
  final LangRepo langRepo;

  String? _fcmToken;

  Future<String?> getFcmToken() async {
    if (validString(_fcmToken)) {
      return _fcmToken!;
    }
    await initFcmToken();
    return _fcmToken;
  }

  Future _sendFCMToServer(String? fcmToken) async {
    log('SetupFCM._sendFCMToServer');

    if (fcmToken == null) return;

    _fcmToken = fcmToken;

    try {
      final token = await cacheHelper.get(kUserKey).then((json) =>
          json == null ? null : UserModel.fromJson(json).userData.token);
      if (!validString(token)) {
        return;
      }

      await cacheHelper.put(kUserToken, fcmToken);

      // await apiHelper.patchData(
      //   EndPoints.updateDeviceToken,
      //   typeJSON: true,
      //   signOutOn: false,
      //   token: token,
      //   lang: langRepo.lang,
      //   data: {
      //     "endpoint": _fcmToken!,
      //   },
      // );
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  final List<StreamSubscription> _subs = [];

  void init() {
    log('SetupFCM.init');
    if (supportsFirebase) {
      _debouncer.run(() async => _initFCM(), 2000);
    }
  }

  void _initFCM() async {
    log('SetupFCM._initFCM');
    // if (flutterLocalNotificationsPlugin == null) {
    //   await initNotifications();
    // }

    // final details = await flutterLocalNotificationsPlugin?.getNotificationAppLaunchDetails();
    // if (details?.notificationResponse != null) {
    // onNotificationTapped(details!.notificationResponse!);
    // }

    await initFcmToken();

    // _subs.add(FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) => _sendFCMToServer(fcmToken)));

    // _subs.add(FirebaseMessaging.onMessage.listen((event) => showNotification(event, _handler)));
  }

  initFcmToken() async {
    // final fcmToken = await FirebaseMessaging.instance.getToken();
    //
    // log('FCM : $fcmToken');
    //
    // _sendFCMToServer(fcmToken);
  }

  SilentNotificationHandler? _handler;

  set dataHandler(SilentNotificationHandler handler) {
    _handler = handler;
  }

  void loggedIn() async {
    log('SetupFCM.loggedIn');
    if (supportsFirebase) {
      // FirebaseMessaging.instance.subscribeToTopic('all');
    }
  }

  void logout() async {
    log('SetupFCM.logout');
    if (supportsFirebase) {
      // FirebaseMessaging.instance.unsubscribeFromTopic('all');
    }
  }

  void dispose() async {
    log('SetupFCM.dispose');
    for (final sub in _subs) {
      await sub.cancel();
    }
  }
}
