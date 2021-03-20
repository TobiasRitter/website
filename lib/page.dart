import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final Builder builder;
  final bool coverScreenHeight;
  final ThemeData themeData;

  const Page(
      {Key? key,
      required this.builder,
      required this.coverScreenHeight,
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
        ),
        color: themeData.canvasColor,
        child: builder,
      ),
    );
  }
}
