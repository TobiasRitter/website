import 'package:flutter/material.dart';
import 'package:website/hover_button.dart';
import 'package:website/main.dart';

class MobileMenu extends StatelessWidget {
  final Function(int) scrollFunc;

  const MobileMenu({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Container(
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: EdgeInsets.all(marginSize),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Future.delayed(drawerCloseDuration)
                          .then((_) => scrollFunc(2));
                    },
                    child: Text("Resume"),
                  ),
                  Container(
                    height: marginSize / 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Future.delayed(drawerCloseDuration)
                          .then((_) => scrollFunc(3));
                    },
                    child: Text("Projects"),
                  ),
                  Container(
                    height: marginSize / 2,
                  ),
                  HoverButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Future.delayed(drawerCloseDuration)
                          .then((_) => scrollFunc(4));
                    },
                    text: "Contact",
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
