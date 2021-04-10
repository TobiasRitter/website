import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verticalMarginSize = getVerticalMargin(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.bottomLeft,
            child: SelectableText(
              "Tobias Ritter",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Theme.of(context).canvasColor),
              maxLines: 1,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: verticalMarginSize / 2),
            child: FittedBox(
              alignment: Alignment.topLeft,
              child: SelectableText(
                SUBTITLE,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Theme.of(context).canvasColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
