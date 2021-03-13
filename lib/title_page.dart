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
      upperBound: 64,
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
    return p.Page(
      dark: true,
      builder: Builder(
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: screenWidth > 800 ? screenWidth / 3 : screenWidth,
                child: Image.asset("res/ProfilePicture.png"),
              ),
              Container(
                width: screenWidth > 800 ? screenWidth * 2 / 3 : screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 192,
                      ),
                      Text(
                        "Tobias Ritter",
                        style: getTitle1Style(context),
                      ),
                      Container(
                        height: 64,
                      ),
                      Container(
                        width: 840,
                        child: Text(
                          "I am a Computer Science student currently working on a master's degree and especially interested in Data Analytics and Machine Learning.",
                          style: getSubtitle1Style(context),
                        ),
                      ),
                      Container(
                        height: 64,
                      ),
                      Container(
                        width: 840,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            Text("Take", style: getText1Style(context)),
                            Text("a", style: getText1Style(context)),
                            Text("look", style: getText1Style(context)),
                            Text("at", style: getText1Style(context)),
                            Text("my", style: getText1Style(context)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: TextButton.icon(
                                    onPressed: null,
                                    icon: Icon(Icons.school),
                                    label: Text(
                                      "resume",
                                      style: getButton1Style(context),
                                    ),
                                  ),
                                ),
                                Text(",", style: getText1Style(context)),
                              ],
                            ),
                            Text("go", style: getText1Style(context)),
                            Text("through", style: getText1Style(context)),
                            Text("my", style: getText1Style(context)),
                            Text("side", style: getText1Style(context)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: TextButton.icon(
                                    onPressed: null,
                                    icon: Icon(Icons.code),
                                    label: Text(
                                      "projects",
                                      style: getButton1Style(context),
                                    ),
                                  ),
                                ),
                              ],
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: TextButton.icon(
                                    onPressed: null,
                                    icon: Icon(Icons.alternate_email),
                                    label: Text(
                                      "contact",
                                      style: getButton1Style(context),
                                    ),
                                  ),
                                ),
                                Text(".", style: getText1Style(context)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 64,
                      ),
                      Container(
                        height: 192,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: controller.value),
                              child: Opacity(
                                opacity: 0.15,
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 128,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
