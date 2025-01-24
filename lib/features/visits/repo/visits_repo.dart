import 'package:dartz/dartz.dart';
import 'package:dio_adapter/dio_adapter.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/features/visits/models/visits_response_model.dart';

import '../../../config/app_config.dart';

class VisitsRepo {
  VisitsRepo();

  final DioAdapterBase _dioAdapterBase = getIt.get<ApiHandler>().dioAdapterBase;

  Future<Either<String, VisitsResponseModel>> getVisitsData(
      {required int type}) async {
    /// detect the type of visit end point
    String endPoint = type == 0 ? EndPoints.preVisits : EndPoints.nextVisits;
    final result = await _dioAdapterBase.get(endPoint);

    if (result.isRight) {
      VisitsResponseModel orderContractsResponseModel =
          VisitsResponseModel.fromJson(result.right.data);
      return Right(orderContractsResponseModel);
    } else {
      return Left(result.left.toString());
    }
  }
}
