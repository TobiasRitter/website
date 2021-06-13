import 'package:flutter/material.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  final Function(BuildContext, int) scrollFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Tobias Ritter",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(),
        Row(
          children: [
            TextButton(
              onPressed: () => scrollFunc(context, 1),
              child: Text("Resume"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: TextButton(
                onPressed: () => scrollFunc(context, 2),
                child: Text("Projects"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: TextButton(
                onPressed: () => scrollFunc(context, 3),
                child: Text("Contact"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
