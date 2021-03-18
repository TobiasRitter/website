import 'package:flutter/material.dart';
import 'package:website/main.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  final Function(int) scrollFunc;

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          style: menuButtonStyle,
          onPressed: () => scrollFunc(1),
          icon: Icon(
            Icons.school,
          ),
          label: Text(
            "resume",
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          style: menuButtonStyle,
          onPressed: () => scrollFunc(2),
          icon: Icon(
            Icons.code,
          ),
          label: Text(
            "projects",
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          style: menuButtonStyle,
          onPressed: () => scrollFunc(3),
          icon: Icon(
            Icons.alternate_email,
          ),
          label: Text(
            "contact",
          ),
        ),
      ],
    );
  }
}
