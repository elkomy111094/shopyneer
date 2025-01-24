import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/features/contracts/models/contracts_response_model.dart';
import 'package:shopyneer/features/contracts/repo/contracts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contracts_state.dart';

class ContractsCubit extends Cubit<ContractsState> {
  ContractsCubit() : super(const InitialContractsState());

  ContractsResponseModel? activeContracts;
  ContractsResponseModel? completedContracts;

  Future getContractsDataWithDataBase(int? stateId) async {
    emit(const LoadingContractsState());
    final result =
        await getIt.get<ContractsRepo>().getContractsData(stateId: stateId);
    result.fold(
      (error) {
        emit(ErrorContractsState(error: error));
      },
      (contractsResponseModel) {
        emit(LoadedContractsState(
            contractsResponseModel: contractsResponseModel));
      },
    );
  }
}
