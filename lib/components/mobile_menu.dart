import 'package:flutter/material.dart';
import 'package:website/main.dart';

class MobileMenu extends StatelessWidget {
  final Function(BuildContext, int) scrollFunc;
  final Function() closeFunc;

  const MobileMenu({
    Key? key,
    required this.scrollFunc,
    required this.closeFunc,
  }) : super(key: key);

  void closeAndScroll(BuildContext context, int index) {
    closeFunc();
    Future.delayed(animationDuration).then((_) => scrollFunc(context, index));
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      height: screenHeight - (verticalMargin * 2 + 48),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: (verticalMargin * 2 + 48),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: verticalMargin,
          ),
          child: Column(
            children: [
              Expanded(
                child: isPortrait(context)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => closeAndScroll(context, 2),
                            child: Text("Resume"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: verticalMargin / 2),
                            child: TextButton(
                              onPressed: () => closeAndScroll(context, 3),
                              child: Text("Projects"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: verticalMargin / 2),
                            child: FloatingActionButton.extended(
                              onPressed: () => closeAndScroll(context, 4),
                              label: Text("Contact"),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => closeAndScroll(context, 2),
                            child: Text("Resume"),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: horizontalMargin / 2),
                            child: TextButton(
                              onPressed: () => closeAndScroll(context, 3),
                              child: Text("Projects"),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: horizontalMargin / 2),
                            child: FloatingActionButton.extended(
                              onPressed: () => closeAndScroll(context, 4),
                              label: Text("Contact"),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
