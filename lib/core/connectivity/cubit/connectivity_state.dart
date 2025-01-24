abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {
  ConnectivityConnected();
}

class ConnectivityDisconnected extends ConnectivityState {}
