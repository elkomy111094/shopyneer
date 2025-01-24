import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/features/visits/models/visits_response_model.dart';
import 'package:shopyneer/features/visits/repo/visits_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'visits_state.dart';

class VisitsCubit extends Cubit<VisitsState> {
  VisitsCubit() : super(const VisitsInitialState());

  Future<void> getVisitsDataWithDataBase(int? typeId) async {
    emit(const VisitsLoadingState());
    final result = await getIt.get<VisitsRepo>().getVisitsData(type: typeId ?? 0);
    result.fold(
      (error) {
        emit(VisitsErrorState(error: error));
      },
      (visitsResponseModel) {
        emit(VisitsLoadedState(visitsResponseModel: visitsResponseModel));
      },
    );
  }
}
