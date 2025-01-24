import 'package:shopyneer/features/Auth/model/auth_model.dart';

abstract class LoginState {
  const LoginState();
}

class InitialLoginState extends LoginState {
  const InitialLoginState();
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class ErrorLoginState extends LoginState {
  final String error;
  const ErrorLoginState(this.error);
}

class SuccessLoginState extends LoginState {
  final AuthModel authModel;
  const SuccessLoginState(this.authModel);
}
