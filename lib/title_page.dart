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
    var marginSize = getMarginSize(context);
    return p.Page(
      dark: true,
      coverScreenHeight: false,
      child: Column(
        children: [
          screenWidth > SWIDTH
              ? Padding(
                  padding: EdgeInsets.all(marginSize),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () => widget.scrollFunc(2),
                        icon: Icon(Icons.school),
                        label: Text("resume"),
                      ),
                      Container(
                        width: marginSize / 2,
                      ),
                      TextButton.icon(
                        onPressed: () => widget.scrollFunc(3),
                        icon: Icon(Icons.code),
                        label: Text("projects"),
                      ),
                      Container(
                        width: marginSize / 2,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () => widget.scrollFunc(4),
                        icon: Icon(Icons.alternate_email),
                        label: Text("contact"),
                      ),
                    ],
                  ),
                )
              : Container(),
          screenWidth > SWIDTH
              ? buildDesktopLayout(context)
              : Expanded(
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
                ),
        ],
      ),
    );
  }

  Expanded buildDesktopLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "res/ProfilePicture.png",
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: EdgeInsets.all(marginSize),
            child: Container(
              constraints: BoxConstraints(maxWidth: MWIDTH),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(marginSize),
                      child: Logo(),
                    ),
                  ),
                  buildArrow(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArrow(BuildContext context) {
    return GestureDetector(
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
                color: lightTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    "Tobias Ritter",
                    style: titleStyle.copyWith(
                      color: lightTheme.primaryColor,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    "Computer Science Student & Developer",
                    style: subtitleStyle.copyWith(
                      color: lightTheme.primaryColor,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
