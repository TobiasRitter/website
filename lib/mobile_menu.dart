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
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
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
                child: isPortrait(context)
                    ? Column(
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
                          Padding(
                            padding: EdgeInsets.only(top: verticalMargin / 2),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Future.delayed(drawerCloseDuration)
                                    .then((_) => scrollFunc(3));
                              },
                              child: Text("Projects"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: verticalMargin / 2),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                Navigator.pop(context);
                                Future.delayed(drawerCloseDuration)
                                    .then((_) => scrollFunc(4));
                              },
                              label: Text("Contact"),
                            ),
                          ),
                        ],
                      )
                    : Row(
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: horizontalMargin / 2),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Future.delayed(drawerCloseDuration)
                                    .then((_) => scrollFunc(3));
                              },
                              child: Text("Projects"),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: horizontalMargin / 2),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                Navigator.pop(context);
                                Future.delayed(drawerCloseDuration)
                                    .then((_) => scrollFunc(4));
                              },
                              label: Text("Contact"),
                            ),
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
