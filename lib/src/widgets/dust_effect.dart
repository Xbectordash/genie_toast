import 'dart:math';

import 'package:flutter/material.dart';

class DustEffect extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const DustEffect({
    super.key,
    required this.child,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final random = Random(1);

        return Transform.translate(
          offset: Offset(
            random.nextDouble() * 40 * animation.value,
            -30 * animation.value,
          ),
          child: Opacity(
            opacity: 1 - animation.value,
            child: Transform.scale(
              scale: 1 - (animation.value * 0.1),
              child: child,
            ),
          ),
        );
      },
    );
  }
}