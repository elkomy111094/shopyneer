import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/paramaters/register_paramaters.dart';
import 'package:shopyneer/features/Auth/repo/auth_repo.dart';

import 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(const InitialRegisterState());

  Future<void> register({required RegisterParam parameters}) async {
    emit(const LoadingRegisterState());
    final result =
        await getIt.get<AuthRepo>().registerWithDataBase(param: parameters);

    result.fold(
      (error) => emit(ErrorRegisterState(error)),
      (authModel) => emit(SuccessRegisterState(authModel)),
    );
  }
}
