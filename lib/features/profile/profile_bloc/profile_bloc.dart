import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/paramaters/update_profile_parameters.dart';
import 'package:shopyneer/features/profile/models/profile_response_model.dart';
import 'package:shopyneer/features/profile/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(const InitialProfileState());

  ProfileResponseModel? profileResponseModel;
  Future<void> getProfileDataWithDataBase() async {
    emit(const LoadingProfileState());
    final f = await getIt.get<ProfileRepo>().getProfileData();
    await f.fold(
      (error) async {
        emit(ErrorProfileState(error: error));
      },
      (profileModel) async {
        profileResponseModel = profileModel;
        emit(
          SuccessProfileState(
            profileResponseModel: profileModel,
          ),
        );
      },
    );
  }

  Future<void> updateProfileData(
      {required UpdateProfileParam parameters}) async {
    emit(const UpdateProfileDataLoadingState());
    final result =
        await getIt.get<ProfileRepo>().updateProfileData(param: parameters);

    await result.fold(
      (error) async {
        emit(UpdateProfileDataFailedState(
          error: error,
        ));
      },
      (profile) async {
        emit(UpdateProfileDataSuccessState(globalResponseModel: profile));
      },
    );
  }
}
