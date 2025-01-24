import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/features/Auth/repo/auth_repo.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const InitialLoginState());

  loginWithDataBase(
      {required String phone, required String countryCode}) async {
    emit(const LoadingLoginState());
    final f = await getIt.get<AuthRepo>().loginWithDataBase(
          phone: phone,
          countryCode: countryCode,
        );
    await f.fold(
      (error) async {
        emit(ErrorLoginState(error));
      },
      (authModel) {
        emit(SuccessLoginState(authModel));
      },
    );
  }

  Future<void> changeLang(String lang, BuildContext context) async {
    // emit(
    //   state.copyWith(
    //     changeLangState: state.changeLangState.asLoading(),
    //   ),
    // );
    // final data = await langRepo.setLang(lang, context);
    // data.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       changeLangState: state.changeLangState.asLoadingFailed(l),
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       changeLangState:
    //           state.changeLangState.asLoadingSuccess(success: true),
    //     ),
    //   ),
    // );
  }
}
