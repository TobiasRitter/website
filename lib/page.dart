import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Page extends StatelessWidget {
  final Builder builder;
  final bool dark;
  final bool coverScreenHeight;
  final bool restrictScreenHeight;

  const Page({
    Key? key,
    required this.builder,
    required this.dark,
    required this.coverScreenHeight,
    required this.restrictScreenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Theme(
      data: dark ? darkTheme : lightTheme,
      child: Container(
        constraints: BoxConstraints(
          minHeight: coverScreenHeight ? screenHeight : 0.0,
          maxHeight: restrictScreenHeight ? screenHeight : double.infinity,
        ),
        color: dark ? darkTheme.canvasColor : lightTheme.canvasColor,
        child: builder,
      ),
    );
  }
}
