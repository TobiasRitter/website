import 'package:flutter/material.dart';
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

    var menu = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: () => widget.scrollFunc(1),
          icon: Icon(
            Icons.school,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "resume",
            style: getButtonStyle(context),
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          onPressed: () => widget.scrollFunc(2),
          icon: Icon(
            Icons.code,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "projects",
            style: getButtonStyle(context),
          ),
        ),
        Container(
          width: marginSize,
        ),
        TextButton.icon(
          onPressed: () => widget.scrollFunc(3),
          icon: Icon(
            Icons.alternate_email,
            size: getButtonStyle(context).fontSize,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "contact",
            style: getButtonStyle(context),
          ),
        ),
      ],
    );

    var text = Padding(
      padding: EdgeInsets.all(marginSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "Welcome,",
              style: getTitleStyle(context),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "I am a Computer Science student currently working on my master's degree and especially interested in Data Analytics and Machine Learning.",
              style: getSubtitleStyle(context),
              textAlign: TextAlign.center,
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
                      color: Theme.of(context).accentColor,
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
      dark: false,
      coverScreenHeight: true,
      restrictScreenHeight: true,
      builder: Builder(
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(marginSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Logo(),
                    screenWidth > SWIDTH
                        ? menu
                        : GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Icon(Icons.menu),
                          ),
                  ],
                ),
              ),
              Expanded(
                child: screenWidth > SWIDTH
                    ? Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "res/ProfilePicture.png",
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: text,
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
