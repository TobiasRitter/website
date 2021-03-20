import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/desktop_menu.dart';
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

    var text = Padding(
      padding: EdgeInsets.all(marginSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "Tobias Ritter",
              maxLines: 1,
              style: getTitleStyle(context),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "Computer Science Student & Developer",
              style: getSubtitleStyle(context),
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
