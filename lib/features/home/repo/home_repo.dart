import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/features/home/models/advertising_response_model.dart';
// Import your new model
import 'package:shopyneer/features/home/models/products_general_response.dart';

import '../../../config/app_config.dart';

class HomeRepo {
  HomeRepo();

  Future<Either<String, AdvertismentResponseModel>> getAdvertisingData() async {
    var requestData = {
      "page": 1,
      "pageSize": 3,
      "sortColumn": "date",
      "sortColumnDirection": "desc"
    };

    final result = await getIt.get<ApiHandler>().dioAdapterBase.post(
          EndPoints.advertismentWithDataBase,
          body: requestData,
        );

    if (result.isLeft) {
      return Left(result.left.toString());
    } else {
      AdvertismentResponseModel orderContractsResponseModel =
          AdvertismentResponseModel.fromJson(result.right.data);
      return Right(orderContractsResponseModel);
    }
  }

  Future<Either<String, GeneralProductsResponse>> getProductsData() async {
    var headers = {
      'Accept': 'application/json',
      'x-publishable-api-key':
          'pk_422d948afc170c03a66508e44f6c36da2656ae2ab2018fdf8ab540908258fe1e'
    };

    final response = (await getIt.get<ApiHandler>().dioAdapterBase.get(
          'backend-production-b092.up.railway.app/store/products',
          options: Options(
            headers: headers,
          ),
        ));

    Logger().d(response.right.data);

    if (response.isLeft) {
      return Left(response.left.toString());
    } else {
      GeneralProductsResponse generalProductsResponse =
          GeneralProductsResponse.fromJson(response.right.data);
      return Right(generalProductsResponse);
    }
  }
}
