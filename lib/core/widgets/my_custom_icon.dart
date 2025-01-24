import 'package:flutter/material.dart';

class MyCustomIconsWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color? backGround;
  final void Function()? onTap;
  final Widget childWidget;
  final bool? showShadow;

 const MyCustomIconsWidget({
    super.key,
    this.height = 50,
    this.width = 50,
    this.backGround = Colors.white,
    this.showShadow,
    required this.onTap,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backGround,
          boxShadow: showShadow == null || showShadow == true
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: -3,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  )
                ]
              : [],
          shape: BoxShape.circle,
        ),
        child: childWidget,
      ),
    );
  }
}
