part of 'visits_cubit.dart';

abstract class VisitsState {
  const VisitsState();
}

class VisitsInitialState extends VisitsState {
  const VisitsInitialState();
}

class VisitsLoadingState extends VisitsState {
  const VisitsLoadingState();
}

class VisitsLoadedState extends VisitsState {
  final VisitsResponseModel visitsResponseModel;
  const VisitsLoadedState({required this.visitsResponseModel});
}
class VisitsErrorState extends VisitsState {
  final String error;
  const VisitsErrorState({required this.error});
}

