import 'package:flutter/material.dart';
import 'package:website/main.dart';

class CopyrightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var year = DateTime.now().year.toString();
    return TextButton.icon(
      onPressed: () => showLicensePage(context: context),
      icon: Opacity(
        child: Icon(Icons.copyright_sharp),
        opacity: BORDER_OPACITY,
      ),
      label: Opacity(
        child: Text(year),
        opacity: BORDER_OPACITY,
      ),
    );
  }
}
