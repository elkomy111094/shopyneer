import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio_adapter/dio_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/paramaters/register_paramaters.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';

import '../../../config/app_config.dart';
import '../../../core/app/app_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../model/auth_model.dart';

class AuthRepo {
  // final FirebaseAuth firebaseAuth;
  AuthData? user;
  String? token;
  File? profileImageFile;
  var picker = ImagePicker();

  AuthRepo();

  final DioAdapterBase _dioAdapterBase = getIt.get<ApiHandler>().dioAdapterBase;

  Future<Either<String, void>> logout() async {
    final result = await _dioAdapterBase.post(
      EndPoints.logout,
    );
    if (result.isRight) {
      _removeUser();
      return const Right(null);
    } else {
      return Left(result.left.toString());
    }
  }

  Future<Either<String, AuthModel>> loginWithDataBase(
      {required String phone, required String countryCode}) async {
    final result = await _dioAdapterBase.post(
      EndPoints.loginWithDataBase,
      body: {
        "email": "elkomy.dev@gmail.com",
      },
    );

    if (result.isRight) {
      AuthModel authModel = AuthModel.fromJson(result.right.data);
      return Right(authModel);
    } else {
      return Left(result.left.toString());
    }
  }

  Future<Either<String, AuthModel>> registerWithDataBase(
      {required RegisterParam param}) async {
    final result = await _dioAdapterBase.post(
      EndPoints.registerWithDataBase,
      body: {
        "userName": param.name,
        "phoneNumber": param.email,
        "countryCode": param.countryCode,
        "longitude": param.longitude,
        "latitude": param.latitude,
        "addresTitle": param.addressTitle,
      },
    );

    if (result.isRight) {
      AuthModel authModel = AuthModel.fromJson(result.right.data);
      return Right(authModel);
    } else {
      return Left(result.left.toString());
    }
  }

  Future<Either<String, AuthModel>> checkOtp(
      {required String otpCode,
      required String phoneNumber,
      required String countryCode}) async {
    Logger().d(otpCode);
    final result = await _dioAdapterBase.post(
      EndPoints.checkOtpWithDataBase,
      body: {"email": "elkomy.dev@gmail.com", "otpCode": otpCode},
    );

    if (result.isRight) {
      AuthModel authModel = AuthModel.fromJson(result.right.data);
      if (authModel.userData.token.isNotEmpty) {
        _saveUser(authModel, true);
      }
      return Right(authModel);
    } else {
      return Left(result.left.toString());
    }
  }

  _saveUser(AuthModel? authModel, [bool rememberMe = true]) async {
    debugPrint('AuthRepo._saveUser');
    user = authModel!.userData;
    token = user!.token;
    await getIt.get<CacheHelper>().put(kUserToken, token);
    await AppBloc().loggedIn(user!);
    if (rememberMe) {
      await getIt.get<CacheHelper>().put(kUserKey, user!.toJson());
      debugPrint('AuthRepo._saveUser rememberMe');
    }
  }

  _removeUser() async {
    user = null;
    token = null;
    await AppBloc().loggedOut();
    await getIt.get<CacheHelper>().clear(kUserKey);
  }

  Future<bool> checkUser() async {
    final userJson = await getIt.get<CacheHelper>().get(kUserKey);
    if (userJson == null) {
      debugPrint('AuthRepo.checkUser null');
      return false;
    }
    // todo get user from server
    user = AuthData.fromJson(userJson);
    token = await getIt.get<CacheHelper>().get(kUserToken);
    logger.i(token.toString());
    logger.i(token.toString());
    await AppBloc().loggedIn(user!);
    return true;
  }
}
