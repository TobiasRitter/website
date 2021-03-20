import 'package:flutter/material.dart';
import 'package:website/logo.dart';
import 'package:website/main.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) scrollFunc;
  const MobileDrawer({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Theme(
      data: darkTheme,
      child: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.all(marginSize),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Logo(),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            scrollFunc(1);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: getMenuButtonStyle(context).fontSize,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Container(
                                  width: marginSize / 2,
                                ),
                                Text(
                                  "about",
                                  style: getMenuButtonStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            scrollFunc(2);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.school,
                                  size: getMenuButtonStyle(context).fontSize,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Container(
                                  width: marginSize / 2,
                                ),
                                Text(
                                  "resume",
                                  style: getMenuButtonStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            scrollFunc(3);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.code,
                                  size: getMenuButtonStyle(context).fontSize,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Container(
                                  width: marginSize / 2,
                                ),
                                Text(
                                  "projects",
                                  style: getMenuButtonStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            scrollFunc(4);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.alternate_email,
                                  size: getMenuButtonStyle(context).fontSize,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Container(
                                  width: marginSize / 2,
                                ),
                                Text(
                                  "contact",
                                  style: getMenuButtonStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
