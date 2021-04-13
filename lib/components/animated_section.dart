import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

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
      duration: Duration(milliseconds: 500),
      builder: (
        BuildContext context,
        Animation<double> animation,
      ) =>
          FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
