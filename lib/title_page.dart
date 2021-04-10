import 'package:flutter/material.dart';
import 'package:website/arrow.dart';
import 'package:website/logo.dart';
import 'package:website/main.dart';

class TitlePage extends StatefulWidget {
  final Function(int) scrollFunc;
  const TitlePage({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      height: screenHeight,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalMargin, horizontal: horizontalMargin),
            child: isMobile(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu_sharp,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: Scaffold.of(context).openEndDrawer,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => widget.scrollFunc(2),
                        child: Text(
                          "Resume",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: horizontalMargin / 2),
                        child: TextButton(
                          onPressed: () => widget.scrollFunc(3),
                          child: Text(
                            "Projects",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: horizontalMargin / 2),
                        child: FloatingActionButton.extended(
                          onPressed: () => widget.scrollFunc(4),
                          label: Text("Contact"),
                        ),
                      ),
                    ],
                  ),
          ),
          isPortrait(context)
              ? buildMobileLayout(context)
              : buildDesktopLayout(context),
        ],
      ),
    );
  }

  Expanded buildMobileLayout(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalMargin,
                0,
                horizontalMargin,
                verticalMarginSize,
              ),
              child: Logo(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              "res/PBCompressed.png",
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildDesktopLayout(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              "res/PBCompressed.png",
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalMargin,
                vertical: verticalMarginSize,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Logo(),
                  ),
                  Arrow(
                    scrollFunc: widget.scrollFunc,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
