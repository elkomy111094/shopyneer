import 'package:bloc/bloc.dart';

import 'base_state.dart';

/// Base Cubit class to handle state management
/// Extends `Cubit` to provide a generic way to manage states.
abstract class BaseCubit<State extends BaseState> extends Cubit<State> {
  BaseCubit(State initialState) : super(initialState);

  // Common method for loading state handling (can be overridden by child classes)
  Future<void> loadData();
}
