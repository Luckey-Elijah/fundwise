import 'dart:async';
import 'dart:math';

import 'package:app/components/fundwise_logo.dart';
import 'package:flutter/material.dart';

export 'package:app/splash/splash_location.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
    this.initializationFuture,
    this.completer,
  });

  final Future<void>? initializationFuture;
  final Completer<void>? completer;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
  late Animation<double> animation = TweenSequence([
    TweenSequenceItem<double>(
      tween: ConstantTween(1),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: CurveTween(curve: Curves.bounceOut),
      weight: 2,
    ),
    TweenSequenceItem<double>(
      tween: ConstantTween(1),
      weight: 1,
    ),
  ]).animate(controller);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const fundwiseLogo = FundwiseLogo(size: 48);
    return Material(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final a = animation;

          return Center(
            child: Transform.rotate(
              angle: a.value * 2.0 * pi,
              child: child,
            ),
          );
        },
        child: fundwiseLogo,
      ),
    );
  }
}
