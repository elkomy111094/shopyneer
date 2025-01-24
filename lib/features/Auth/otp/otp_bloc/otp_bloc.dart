import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/auth_repo.dart';
import 'otp_state.dart';

class OtpBloc extends Cubit<OtpState> {
  OtpBloc() : super(const InitialOtpState());

  Future<void> checkOtp(
      {required String phone,
      required String countryCode,
      required String code}) async {
    emit(const LoadingOtpState());
    final result = await getIt
        .get<AuthRepo>()
        .checkOtp(countryCode: countryCode, phoneNumber: phone, otpCode: code);

    result.fold(
      (error) => emit(ErrorOtpState(error: error)),
      (authModel) => emit(SuccessOtpState(authModel: authModel)),
    );
  }
}
