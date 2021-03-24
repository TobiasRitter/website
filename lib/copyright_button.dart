import 'package:flutter/material.dart';
import 'package:website/main.dart';

class CopyrightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton.icon(
        onPressed: () => showLicensePage(context: context),
        icon: Opacity(
          child: Icon(Icons.copyright_sharp),
          opacity: OPACITY,
        ),
        label: Opacity(
          child: Text("2021"),
          opacity: OPACITY,
        ),
      ),
    );
  }
}
