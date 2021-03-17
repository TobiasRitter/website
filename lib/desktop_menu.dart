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
          onPressed: () => scrollFunc(1),
          icon: Icon(
            Icons.school,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "resume",
            style: getButtonStyle(context),
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          onPressed: () => scrollFunc(2),
          icon: Icon(
            Icons.code,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "projects",
            style: getButtonStyle(context),
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          onPressed: () => scrollFunc(3),
          icon: Icon(
            Icons.alternate_email,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "contact",
            style: getButtonStyle(context),
          ),
        ),
      ],
    );
  }
}
