import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/features/splash/widgets/animated_text_widget.dart';
import 'package:shopyneer/features/splash/widgets/logo_widget.dart';
import 'package:shopyneer/features/splash/widgets/splash_bg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // Start the animation
    _controller.forward();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Nav.login(context); // Change '/home' to your next route
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Splach_bg_vector(),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(),
                AnimatedTextWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
