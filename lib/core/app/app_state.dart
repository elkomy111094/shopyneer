import 'package:shopyneer/features/Auth/model/auth_model.dart';
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final AuthData? authData;

  const AppState({
    this.authData,
  });

  AppState copyWith({
    AuthData? user,
    bool userNull = false,
  }) =>
      AppState(
        authData: userNull ? user : user ?? authData,
      );

  bool get isLoggedIn => authData != null;

  @override
  List<Object?> get props => [authData];
}
