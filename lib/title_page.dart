import 'package:flutter/material.dart';
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

class _TitlePageState extends State<TitlePage> with TickerProviderStateMixin {
  late AnimationController arrowController;

  void initState() {
    super.initState();
    arrowController = AnimationController(
      vsync: this,
      duration: arrowAnimationDuration,
      lowerBound: 0,
      upperBound: 1,
    );
    arrowController.addListener(() {
      setState(() {});
    });

    arrowController.repeat(reverse: true);
  }

  void dispose() {
    arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var marginSize = getMarginSize(context);

    var text = Padding(
      padding: EdgeInsets.all(marginSize),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth,
                  child: FittedBox(
                    child: Text(
                      "Tobias Ritter",
                      style: titleStyle,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  child: FittedBox(
                    child: Text(
                      "Computer Science Student & Developer",
                      style: subtitleStyle,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: marginSize),
                  child: screenWidth > SWIDTH
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Take a look at my "),
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(2),
                              icon: Icon(Icons.school),
                              label: Text("resume"),
                            ),
                            Text(" or learn how to get in "),
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(4),
                              icon: Icon(Icons.alternate_email),
                              label: Text("contact"),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => widget.scrollFunc(1),
            child: Container(
              height: getArrowSize(context) + getMarginSize(context),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: arrowController.value * getMarginSize(context)),
                    child: Opacity(
                      opacity: 0.1,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: getArrowSize(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return p.Page(
      themeData: lightTheme,
      coverScreenHeight: true,
      restrictScreenHeight: true,
      builder: Builder(
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: screenWidth > SWIDTH
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Image.asset(
                              "res/ProfilePicture.png",
                              alignment: Alignment.bottomLeft,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: marginSize),
                              child: text,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                "res/ProfilePictureSquared.png",
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight / 2,
                            child: text,
                          ),
                        ],
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
