import 'package:shopyneer/features/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_config.dart';
import '../../../core/cache/cache_helper.dart';
import '../../Auth/repo/auth_repo.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc(this.cacheHelper, this.authRepo) : super(const SplashState());

  final AuthRepo authRepo;
  final CacheHelper cacheHelper;

  checkUser() async {
    emit(state.asLoading());
    final checkUser = await authRepo.checkUser();
    final checkOnBoardingSkipped = await cacheHelper.has(kUserOnBoardIsSkipped);
    emit(state.asLoadingSuccess(checkUser, checkOnBoardingSkipped));
  }
}
