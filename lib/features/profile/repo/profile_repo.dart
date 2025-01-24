import 'package:dartz/dartz.dart';
import 'package:dio_adapter/dio_adapter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopyneer/config/app_config.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/cache/cache_helper.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/models/global_response_model.dart';
import 'package:shopyneer/core/paramaters/update_profile_parameters.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/core/utils/pick_image_utils.dart';
import 'package:shopyneer/features/Auth/model/auth_model.dart';

import 'package:shopyneer/features/profile/models/profile_response_model.dart';

class ProfileRepo {
  // final FirebaseAuth firebaseAuth;
  ProfileResponseModel? profileData;
  AuthData? user;
  ProfileResponseModel? repoProfileData;
  ProfileRepo();

  final DioAdapterBase _dioAdapterBase = getIt.get<ApiHandler>().dioAdapterBase;

  Future<Either<String, ProfileResponseModel>> getProfileData() async {
    String? token = await getIt.get<CacheHelper>().get(kUserToken);
    if (token == null) {
      return Left(Loc.unknownNow());
    } else {
      final result =
          await _dioAdapterBase.get(EndPoints.profileDataWithDataBase);
      if (result.isRight) {
        ProfileResponseModel profileResponseModel =
            ProfileResponseModel.fromJson(result.right.data);
        repoProfileData = profileResponseModel;
        return Right(profileResponseModel);
      } else {
        return Left(result.left);
      }
    }
  }

  Future<MultipartFile> convertXFileToMultipartFile(XFile file) async {
    // Convert XFile to MultipartFile
    return await MultipartFile.fromFile(
      file.path, // Path of the file
      filename: file.name, // Original file name
    );
  }

  Future<Either<String, GlobalResponseModel>> updateProfileData(
      {required UpdateProfileParam param}) async {
    List<MultipartFile> filesList = [];
    if (param.file != null) {
      filesList.add(
        await prepareImageForUpload(param.file!),
      );
    }
    FormData formData = FormData.fromMap({
      if (param.file != null) 'ImageFile': filesList,
      'Name': param.name.toString(),
      'Email': param.email.toString(),
      'NationalId': param.nationalId.toString(),
      'NationalityId': param.nationalityId.toString(),
      "GenderId": param.gender == Loc.male() ? 0 : 1,
    });
    final result = await _dioAdapterBase
        .post(EndPoints.updateProfileWithDataBase, body: formData);
    if (result.isRight) {
      GlobalResponseModel globalResponseModel =
          GlobalResponseModel.fromJson(result.right.data);
      return Right(globalResponseModel);
    } else {
      return Left(result.left);
    }
  }
}
