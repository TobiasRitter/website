import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class TitlePage extends StatefulWidget {
  const TitlePage({
    Key? key,
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
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 32,
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

    var text = Padding(
      padding: EdgeInsets.symmetric(horizontal: margin1size),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: screenWidth > SWIDTH ? screenWidth * 2 / 3 : screenWidth,
            child: FittedBox(
              child: Text(
                "Tobias Ritter",
                style: getTitle1Style(context),
              ),
            ),
          ),
          Container(
            child: Text(
              "I am a Computer Science student currently working on a master's degree and especially interested in Data Analytics and Machine Learning.",
              style: getSubtitle1Style(context),
              textAlign: TextAlign.center,
            ),
          ),
          screenWidth > SWIDTH
              ? Column(
                  children: [
                    Container(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: getText1size(context) / 2,
                        runSpacing: getText1size(context) / 2,
                        children: [
                          Text("Take", style: getText1Style(context)),
                          Text("a", style: getText1Style(context)),
                          Text("look", style: getText1Style(context)),
                          Text("at", style: getText1Style(context)),
                          Text("my", style: getText1Style(context)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.school,
                                  size: getButton1size(context),
                                  color: Theme.of(context).accentColor,
                                ),
                                label: Text(
                                  "resume",
                                  style: getButton1Style(context),
                                ),
                              ),
                              Text(",", style: getText1Style(context)),
                            ],
                          ),
                          Text("go", style: getText1Style(context)),
                          Text("through", style: getText1Style(context)),
                          Text("my", style: getText1Style(context)),
                          Text("side", style: getText1Style(context)),
                          TextButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.code,
                              size: getButton1size(context),
                              color: Theme.of(context).accentColor,
                            ),
                            label: Text(
                              "projects",
                              style: getButton1Style(context),
                            ),
                          ),
                          Text("or", style: getText1Style(context)),
                          Text("learn", style: getText1Style(context)),
                          Text("how", style: getText1Style(context)),
                          Text("to", style: getText1Style(context)),
                          Text("get", style: getText1Style(context)),
                          Text("in", style: getText1Style(context)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.alternate_email,
                                  size: getButton1size(context),
                                  color: Theme.of(context).accentColor,
                                ),
                                label: Text(
                                  "contact",
                                  style: getButton1Style(context),
                                ),
                              ),
                              Text(".", style: getText1Style(context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          Container(
            height: getArrow1size(context) + 32 * getArrow1offset(context),
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
        ],
      ),
    );
    return p.Page(
      dark: false,
      coverScreenHeight: true,
      builder: Builder(
        builder: (context) {
          return screenWidth > SWIDTH
              ? Row(
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth / 3,
                      child: Image.asset(
                        "res/ProfilePicture.png",
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth * 2 / 3,
                      child: text,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: screenHeight / 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin1size),
                        child: Image.asset(
                          "res/ProfilePictureSquared.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight / 2,
                      child: text,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
