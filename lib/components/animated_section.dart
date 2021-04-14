import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:website/main.dart';

class AnimatedSection extends StatelessWidget {
  final Widget child;
  final Key key;

  const AnimatedSection({
    required this.key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisible(
      key: key,
      duration: animationDuration,
      visibleFraction: 0.05,
      builder: (
        BuildContext context,
        Animation<double> animation,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: child,
        ),
      ),
    );
  }
}
