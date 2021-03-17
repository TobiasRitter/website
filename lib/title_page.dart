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
  late AnimationController controller;

  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: arrowAnimationDuration,
      lowerBound: 0,
      upperBound: 1,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var margin1size = getMargin1size(context);

    var menu = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: () => widget.scrollFunc(1),
          icon: Icon(
            Icons.school,
            size: getButton1size(context),
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "resume",
            style: getButton1Style(context),
          ),
        ),
        Container(
          width: margin1size,
        ),
        TextButton.icon(
          onPressed: () => widget.scrollFunc(2),
          icon: Icon(
            Icons.code,
            size: getButton1size(context),
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "projects",
            style: getButton1Style(context),
          ),
        ),
        Container(
          width: margin1size,
        ),
        TextButton.icon(
          onPressed: () => widget.scrollFunc(3),
          icon: Icon(
            Icons.alternate_email,
            size: getButton1size(context),
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            "contact",
            style: getButton1Style(context),
          ),
        ),
      ],
    );

    var text = Padding(
      padding: EdgeInsets.all(margin1size),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "Welcome,",
              style: getTitle1Style(context),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "I am a Computer Science student currently working on my master's degree and especially interested in Data Analytics and Machine Learning.",
              style: getSubtitle1Style(context),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => widget.scrollFunc(1),
            child: Container(
              height: getArrow1size(context) + getArrow1offset(context),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: controller.value * getArrow1offset(context)),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: getArrow1size(context),
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
                padding: EdgeInsets.all(margin1size),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Tobias Ritter",
                          style: getLogo1Style(context),
                        ),
                        Text(
                          "Computer Science Student & Developer",
                          style: getLogo2Style(context),
                        ),
                      ],
                    ),
                    screenWidth > SWIDTH ? menu : Container(),
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
