import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyneer/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:shopyneer/core/connectivity/cubit/connectivity_state.dart';
import 'package:shopyneer/core/widgets/internet_connection_failed_screen.dart';

class ParentWidget extends StatelessWidget {
  final Widget child;
  const ParentWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectivityCubit>(
      create: (context) => ConnectivityCubit()..checkInitialConnectivity(),
      child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ConnectivityDisconnected) {
            return const InternetConnectionFailedScreen();
          }
          return child;
        },
      ),
    );
  }
}
