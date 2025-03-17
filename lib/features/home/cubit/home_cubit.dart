import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/features/home/cubit/home_state.dart';
import 'package:shopyneer/features/home/models/products_general_response.dart';
import 'package:shopyneer/features/home/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState());

  GeneralProductsResponse? generalProductsResponse;

  Future<void> getAdevertisingDataWithDataBase() async {
    emit(const HomeLoadingState());
    final f = await getIt.get<HomeRepo>().getAdvertisingData();
    await f.fold(
      (error) async {
        debugPrint("error is $error");
        emit(HomeFailedState(error: error));
      },
      (model) async {
        emit(HomeSuccessState(advertismentResponseModel: model));
      },
    );
  }

  Future<void> getGeneralProducts() async {
    emit(const generalProductsLoadingState());
    final f = await getIt.get<HomeRepo>().getProductsData();
    await f.fold(
      (error) async {
        debugPrint("error is $error");
        emit(generalProductsFailedState(error: error));
      },
      (model) async {
        generalProductsResponse = model;
        emit(generalProductsSuccessState(generalProductsResponse: model));
      },
    );
  }
}
