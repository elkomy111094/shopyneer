import 'package:dio_adapter/dio_adapter.dart';
import 'package:shopyneer/config/app_config.dart';
import 'package:shopyneer/core/cache/cache_helper.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';

class ApiHandler {
  ApiHandler() {
    _adapterBase = _apiConfig();
  }
  DioAdapterBase _apiConfig() {
    return DioAdapterBase(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentTypeEnum: ContentTypeEnum.applicationJson,
      responseTypeEnum: ResponseTypeEnum.json,
      customRequestHandler: _customRequestHandler,
      customResponseHandler: _customResponseHandler,
      customErrorHandler: _customErrorHandler,
    );
  }

  DioAdapterBase? _adapterBase;
  DioAdapterBase get dioAdapterBase => _adapterBase!;

  Future<RequestOptions> _customRequestHandler(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // get user token
    String? token = await getIt.get<CacheHelper>().get(kUserToken);

    if (options.path == EndPoints.updateProfileWithDataBase) {
      options.contentType = 'multipart/form-data';
    }
    if (options.path == EndPoints.loginWithDataBase) {
      options.headers.addAll({'Accept-Language': 'ar'});
    } else {
      if (token == null) {
        options.headers.addAll({
          'Accept-Language': 'ar',
        });
      } else {
        options.headers.addAll({
          'Authorization': 'Bearer $token',
          'Accept-Language': 'ar',
        });
      }
    }
    return options;
  }

  Future<Response> _customResponseHandler(
      Response<dynamic> response, ResponseInterceptorHandler) async {
    return response;
  }

  Future<DioException> _customErrorHandler(
      DioException error, ErrorInterceptorHandler) async {
    DioException e = DioException(
      message: error.response?.data['message'] ?? error.message,
      error: error.error,
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      stackTrace: error.stackTrace,
    );
    return e;
  }
}
