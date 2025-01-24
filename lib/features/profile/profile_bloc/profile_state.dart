
import 'package:shopyneer/core/models/global_response_model.dart';
import 'package:shopyneer/features/profile/models/profile_response_model.dart';


abstract class ProfileState {
  const ProfileState();
}

class InitialProfileState extends ProfileState {
  const InitialProfileState();
}

class LoadingProfileState extends ProfileState {
  const LoadingProfileState();
}

class ErrorProfileState extends ProfileState {
  final String error;
  const ErrorProfileState({required this.error});
}

class SuccessProfileState extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  const SuccessProfileState({required this.profileResponseModel});
}
class UpdateProfileDataLoadingState extends ProfileState {
  const UpdateProfileDataLoadingState();
}
class UpdateProfileDataSuccessState extends ProfileState {
  final GlobalResponseModel globalResponseModel;
  const UpdateProfileDataSuccessState({required this.globalResponseModel});
}
class UpdateProfileDataFailedState extends ProfileState {
  final String error;
  const UpdateProfileDataFailedState({required this.error});
}