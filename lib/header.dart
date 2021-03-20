import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Header extends StatefulWidget {
  final IconData icon;
  final String text;

  const Header({
    Key? key,
    required this.icon,
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
            FittedBox(
              // TODO: fix overflow
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: marginSize),
                    child: Icon(
                      widget.icon,
                      size: h1Style.fontSize,
                    ),
                  ),
                  Text(
                    widget.text,
                    maxLines: 1,
                    style: h1Style.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
