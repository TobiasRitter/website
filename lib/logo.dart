import 'package:flutter/material.dart';
import 'package:website/main.dart';

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
              "Hello,",
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: marginSize,
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: SelectableText(
              "My name is Tobias Ritter and I am a \nComputer Science student interested in \nData Analytics and Machine Learning",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }
}
