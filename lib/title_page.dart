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

    return p.Page(
      themeData: darkTheme,
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
                              child: buildText(context),
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
                            child: buildText(context),
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

  Padding buildText(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var marginSize = getMarginSize(context);
    return Padding(
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
                      style: titleStyle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
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
                      style: subtitleStyle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
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
                            Text(
                              "Take a look at my ",
                              style: textStyle.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(2),
                              icon: Icon(Icons.school),
                              label: Text("resume"),
                            ),
                            Text(
                              " or learn how to get in ",
                              style: textStyle.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(4),
                              icon: Icon(Icons.alternate_email),
                              label: Text("contact"),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(2),
                              icon: Icon(Icons.school),
                              label: Text("resume"),
                            ),
                            Text(
                              " or ",
                              style: textStyle.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => widget.scrollFunc(4),
                              icon: Icon(Icons.alternate_email),
                              label: Text("contact"),
                            ),
                          ],
                        ),
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
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: getArrowSize(context),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
