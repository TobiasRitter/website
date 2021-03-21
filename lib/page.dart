import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final Widget child;
  final bool coverScreenHeight;
  final bool dark;

  const Page({
    Key? key,
    required this.child,
    required this.coverScreenHeight,
    this.dark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(
        minHeight: coverScreenHeight ? screenHeight : 0.0,
      ),
      color: dark ? Colors.grey.shade100 : Colors.white,
      child: child,
    );
  }
}
