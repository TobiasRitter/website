import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Page extends StatelessWidget {
  final Builder builder;
  final bool dark;
  final bool coverScreenHeight;

  const Page({
    Key? key,
    required this.builder,
    this.dark = false,
    this.coverScreenHeight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Theme(
      data: dark ? darkTheme : lightTheme,
      child: Container(
        constraints: BoxConstraints(
          minHeight: coverScreenHeight ? screenHeight : 0.0,
        ),
        color: dark ? darkTheme.canvasColor : lightTheme.canvasColor,
        child: builder,
      ),
    );
  }
}
