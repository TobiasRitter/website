import 'package:flutter/material.dart';

class CopyrightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var year = DateTime.now().year.toString();
    return TextButton.icon(
      onPressed: () => showLicensePage(context: context),
      icon: Icon(
        Icons.copyright_sharp,
        color: Theme.of(context).dividerColor,
      ),
      label: Text(
        year,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).dividerColor),
      ),
    );
  }
}
