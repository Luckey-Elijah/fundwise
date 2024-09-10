import 'dart:math';

import 'package:app/components/fundwise_logo.dart';
import 'package:flutter/material.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});
  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    animation = TweenSequence([
      TweenSequenceItem(
        tween: CurveTween(curve: Curves.bounceOut),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween(1),
        weight: 1,
      ),
    ]).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final tween = Tween<double>(begin: 0, end: 2 * pi);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.rotate(
            angle: animation.value * 2.0 * pi,
            child: child,
          ),
          child: const FundwiseLogo(size: 48),
        ),
      ),
    );
  }
}
