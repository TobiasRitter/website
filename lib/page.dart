import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Page extends StatelessWidget {
  final Builder builder;
  final bool coverScreenHeight;
  final bool restrictScreenHeight;
  final ThemeData themeData;

  const Page(
      {Key? key,
      required this.builder,
      required this.coverScreenHeight,
      required this.restrictScreenHeight,
      required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Theme(
      data: themeData,
      child: Container(
        constraints: BoxConstraints(
          minHeight: coverScreenHeight ? screenHeight : 0.0,
          maxHeight: restrictScreenHeight ? screenHeight : double.infinity,
        ),
        color: themeData.canvasColor,
        child: builder,
      ),
    );
  }
}
