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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => scrollFunc(context, 2),
          child: Text(
            "Resume",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: TextButton(
            onPressed: () => scrollFunc(context, 3),
            child: Text(
              "Projects",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: FloatingActionButton.extended(
            onPressed: () => scrollFunc(context, 4),
            label: Text("Contact"),
          ),
        ),
      ],
    );
  }
}
