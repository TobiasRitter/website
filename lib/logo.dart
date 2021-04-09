import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.bottomLeft,
            child: SelectableText(
              "Tobias Ritter",
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: marginSize / 2,
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: SelectableText(
              SUBTITLE,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }
}
