import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tobias Ritter",
          style: getLogoStyle(context),
        ),
        Text(
          "Computer Science Student & Developer",
          style: getSubLogoStyle(context),
        ),
      ],
    );
  }
}
