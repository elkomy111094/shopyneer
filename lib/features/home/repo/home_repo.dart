import 'package:dartz/dartz.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/features/home/models/advertising_response_model.dart';

import '../../../config/app_config.dart';

class HomeRepo {
  HomeRepo();

  Future<Either<String, AdvertismentResponseModel>> getAdvertisingData() async {
    //String? token = await di<CacheHelper>().get(kUserToken);
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
}
