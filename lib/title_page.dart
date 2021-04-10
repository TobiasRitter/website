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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var marginSize = getMarginSize(context);
    var verticalMarginSize = getMarginSize2(context);
    return Container(
      height: screenHeight,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalMarginSize, horizontal: marginSize),
            child: screenWidth > SWIDTH
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => widget.scrollFunc(2),
                        child: Text(
                          "Resume",
                        ),
                      ),
                      Container(
                        width: marginSize / 2,
                      ),
                      TextButton(
                        onPressed: () => widget.scrollFunc(3),
                        child: Text(
                          "Projects",
                        ),
                      ),
                      Container(
                        width: marginSize / 2,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () => widget.scrollFunc(4),
                        label: Text("Contact"),
                      ),
                    ],
                  )
                : Row(
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
                  ),
          ),
          screenWidth > SWIDTH
              ? buildDesktopLayout(context)
              : buildMobileLayout(context),
        ],
      ),
    );
  }

  Expanded buildMobileLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    var verticalMarginSize = getMarginSize2(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                marginSize,
                0,
                marginSize,
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
    var marginSize = getMarginSize(context);
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
              padding: EdgeInsets.all(marginSize),
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
