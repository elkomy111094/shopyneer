import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopyneer/core/connectivity/cubit/connectivity_state.dart';


class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityCubit() : super(ConnectivityInitial()) {
    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> checkInitialConnectivity() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      emit(ConnectivityConnected());
      debugPrint("the internet is connected");
    } else {
      emit(ConnectivityDisconnected());
      debugPrint("the internet is disconnected");
    }
  }

  // Manually check the connection status
  Future<void> checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(ConnectivityDisconnected());
    } else {
      final hasInternet = await InternetConnectionChecker().hasConnection;
      if (hasInternet) {
        emit(ConnectivityConnected());
      } else {
        emit(ConnectivityConnected());
      }
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
