import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:size_config/size_config.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.loadingColor});
  final Color? loadingColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: SizedBox(
            width: 120.h,
            height: 120.h,
            child: Lottie.asset(
              "assets/anims/loading.json",
              fit: BoxFit.fill,
              width: double.infinity,
              reverse: true,
            )),
      )
      /*LoadingAnimationWidget.inkDrop(
        color: loadingColor ?? primary,
        size: 40.h,
      )*/
      ,
    );
  }
}
