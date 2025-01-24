import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/api/api_handler.dart';
import 'package:shopyneer/features/contracts/models/contracts_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_adapter/dio_adapter.dart';

import '../../../config/app_config.dart';

class ContractsRepo {
  ContractsRepo();

  Future<Either<String, ContractsResponseModel>> getContractsData(
      {int? stateId}) async {
    DioAdapterBase dioAdapterBase = getIt.get<ApiHandler>().dioAdapterBase;
    var requestData = [stateId ?? 0];
    final result = await dioAdapterBase.post(EndPoints.contractsWithDataBase,
        body: requestData);
    if (result.isRight) {
      ContractsResponseModel orderContractsResponseModel =
          ContractsResponseModel.fromJson(result.right.data);
      return Right(orderContractsResponseModel);
    } else {
      return Left(result.left.toString());
    }
  }
}
