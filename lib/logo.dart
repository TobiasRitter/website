import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          SelectableText(
            "TOBIAS RITTER",
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SelectableText(
            "Computer Science Student",
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
