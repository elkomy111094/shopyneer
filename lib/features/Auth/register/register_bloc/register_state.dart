import 'package:shopyneer/features/Auth/model/auth_model.dart';

abstract class RegisterState {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  const InitialRegisterState();
}

class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState();
}

class ErrorRegisterState extends RegisterState {
  final String error;
  const ErrorRegisterState(this.error);
}

class SuccessRegisterState extends RegisterState {
  final AuthModel authModel;
  const SuccessRegisterState(this.authModel);
}
