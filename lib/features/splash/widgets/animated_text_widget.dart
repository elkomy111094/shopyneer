import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class AnimatedTextWidget extends StatelessWidget {
  TextStyle? style;

  AnimatedTextWidget({
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: false,
      totalRepeatCount: 1,
      animatedTexts: [
        WavyAnimatedText('SHOPYNEER',
            speed: const Duration(milliseconds: 300),
            textAlign: TextAlign.center,
            textStyle: style ?? getBoldWhite32Style()),
      ],
      onTap: () {
        print("I am executing");
      },
    );
  }
}
