import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Header extends StatefulWidget {
  final String text;

  const Header({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var marginSize = getMarginSize(context);
    return Padding(
      padding: EdgeInsets.only(bottom: marginSize),
      child: Container(
        width: screenWidth - 2 * marginSize,
        child: Row(
          children: [
            Expanded(
              child: AutoSizeText(
                widget.text,
                maxLines: 1,
                minFontSize: 1,
                style: h1Style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
