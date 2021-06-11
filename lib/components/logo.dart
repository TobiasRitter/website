import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.bottomLeft,
            child: SelectableText(
              "Tobias Ritter",
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: verticalMarginSize / 2),
          child: SelectableText(
            SUBTITLE,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SelectableText(
          SHORT_DESC,
        ),
      ],
    );
  }
}
