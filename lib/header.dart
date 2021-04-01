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
      padding: EdgeInsets.only(bottom: marginSize * 2),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth - 2 * marginSize,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SelectableText(
                widget.text,
                maxLines: 1,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
