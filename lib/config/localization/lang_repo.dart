import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:shopyneer/config/app_config.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';

import '../../core/cache/cache_helper.dart';
import '../../core/utils/translation_helper.dart';

class LangRepo {
  String? lang;
  LangRepo();

  Future<Either<String, void>> setLang(
      String lang, BuildContext context) async {
    try {
      this.lang = lang;
      getIt.get<CacheHelper>().put(kUserLangKey, lang);
      context.setLocale(
        Locale(
          lang,
        ),
      );
      return const Right(null);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return Left(getServerError());
    }
  }

  Future<Either<String, String>> getLang() async {
    try {
      final kLang = await getIt.get<CacheHelper>().get(kUserLangKey);
      lang = kLang ?? kDefaultLanguage;
      return Right(lang!);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return Left(getServerError());
    }
  }
}
