import 'package:shopyneer/features/Auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_bloc.dart';

class UserSelector extends StatelessWidget {
  const UserSelector({super.key, required this.builder});
  final Widget Function(BuildContext context, AuthData? user) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppBloc, AppState, AuthData?>(
        bloc: AppBloc(), selector: (state) => state.authData, builder: (context, user) => builder(context, user));
  }
}
