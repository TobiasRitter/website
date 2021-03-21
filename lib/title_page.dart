import 'package:flutter/material.dart';
import 'package:website/arrow.dart';
import 'package:website/hover_button.dart';
import 'package:website/logo.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

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
    return Container(
      height: screenHeight,
      child: p.Page(
        dark: true,
        coverScreenHeight: true,
        child: Column(
          children: [
            screenWidth > SWIDTH
                ? Padding(
                    padding: EdgeInsets.all(marginSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => widget.scrollFunc(2),
                          child: Text("Resume"),
                        ),
                        Container(
                          width: marginSize / 2,
                        ),
                        TextButton(
                          onPressed: () => widget.scrollFunc(3),
                          child: Text("Projects"),
                        ),
                        Container(
                          width: marginSize / 2,
                        ),
                        HoverButton(
                          onPressed: () => widget.scrollFunc(4),
                          child: Text("Contact"),
                        ),
                      ],
                    ),
                  )
                : Container(),
            screenWidth > SWIDTH
                ? buildDesktopLayout(context)
                : buildMobileLayout(context),
          ],
        ),
      ),
    );
  }

  Expanded buildMobileLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(marginSize),
            child: Logo(),
          ),
          Image.asset(
            "res/ProfilePicture.png",
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  Expanded buildDesktopLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            "res/ProfilePicture.png",
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
          ),
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: MWIDTH2),
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
            ),
          ),
        ],
      ),
    );
  }
}
