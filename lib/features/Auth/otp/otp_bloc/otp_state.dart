import 'package:shopyneer/features/Auth/model/auth_model.dart';

abstract class OtpState {
  const OtpState();
}

class InitialOtpState extends OtpState {
  const InitialOtpState();
}

class LoadingOtpState extends OtpState {
  const LoadingOtpState();
}

class ErrorOtpState extends OtpState {
  final String error;
  const ErrorOtpState({required this.error});
}

class SuccessOtpState extends OtpState {
  final AuthModel authModel;
  const SuccessOtpState({required this.authModel});
}
