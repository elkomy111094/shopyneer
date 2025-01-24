part of 'contracts_cubit.dart';

abstract class ContractsState {
  const ContractsState();
}

class InitialContractsState extends ContractsState {
  const InitialContractsState();
}

class LoadingContractsState extends ContractsState {
  const LoadingContractsState();
}

class LoadedContractsState extends ContractsState {
  final ContractsResponseModel contractsResponseModel;
  const LoadedContractsState({required this.contractsResponseModel});
}

class ErrorContractsState extends ContractsState {
  final String error;
  const ErrorContractsState({required this.error});
}
