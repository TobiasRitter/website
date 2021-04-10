import 'package:flutter/material.dart';
import 'package:website/main.dart';

class MobileMenu extends StatelessWidget {
  final Function(int) scrollFunc;

  const MobileMenu({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(horizontalMargin),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close_sharp,
                      color: Theme.of(context).canvasColor,
                    ),
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
                      height: horizontalMargin / 2,
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
                      height: horizontalMargin / 2,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pop(context);
                        Future.delayed(drawerCloseDuration)
                            .then((_) => scrollFunc(4));
                      },
                      label: Text("Contact"),
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
      ),
    );
  }
}
