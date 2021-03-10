import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Page extends StatelessWidget {
  final Widget child;
  final bool dark;

  const Page({
    Key? key,
    required this.child,
    this.dark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Theme(
      data: dark ? darkTheme : lightTheme,
      child: Container(
        height: height,
        child: Scaffold(body: child),
      ),
    );
  }
}
