import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Header extends StatefulWidget {
  final String text;
  final bool padding;
  final bool light;

  const Header({
    Key? key,
    required this.text,
    this.padding = true,
    this.light = false,
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
      padding: EdgeInsets.only(bottom: widget.padding ? marginSize * 2 : 0),
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
                style: widget.light
                    ? Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Theme.of(context).canvasColor)
                    : Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
